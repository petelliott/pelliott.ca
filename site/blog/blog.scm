(use-modules (schingle template mustache)
             (schingle load)
             (schingle ftypes)
             (schingle render)
             (srfi srfi-43)
             (ice-9 ftw)
             (ice-9 regex)
             (ice-9 textual-ports)
             (renderers)
             (parameters)
             (pagination))

(define blog-dir (schingle-resolve-path "blog/"))

(define (slug path)
  (basename path (full-file-extension path)))

(define blog-post-template (mustache-compile "blog-post.mustache"))

(define (serve-post path)
  (define url (string-append "/blog/" (slug path)))
  (call-with-input-file path
    (lambda (port)
      (define meta (acons 'url url (read port)))
      (define post (render-content (get-string-all port) path))
      (set! meta (acons 'content post meta))
      (GET-static url (content '(text/html)
                               (blog-post-template meta)))
      meta)))

(define posts
  (stable-sort
   (map
    (lambda (path) (serve-post (in-vicinity blog-dir path)))
    (scandir blog-dir (lambda (path) (not (string-prefix? "." path)))))
   (lambda (a b)
     (string>? (assoc-ref a 'date)
               (assoc-ref b 'date)))))

(define (count-tags posts)
  (define table (make-hash-table))
  (for-each
   (lambda (post)
     (vector-for-each
      (lambda (i tag)
        (hashq-set! table tag (1+ (hashq-ref table tag 0))))
      (assoc-ref post 'tags)))
   posts)
  (stable-sort (hash-map->list cons table)
               (lambda (a b)
                 (if (= (cdr a) (cdr b))
                     (string< (symbol->string (car a))
                              (symbol->string (car b)))
                     (> (cdr a) (cdr b))))))

(define tags (count-tags posts))
(define tag-data (map (lambda (pair) `((tag . ,(car pair)) (count . ,(cdr pair)))) tags))


(add-global-template-parameter 'blog `((posts . ,(list->vector posts))
                                       (tags . ,(list->vector tag-data))
                                       (top10 . ,(list->vector (topn posts 10)))
                                       (last-updated . ,(assoc-ref (car posts) 'date))))


(define blog-template (mustache-compile "blog.mustache"))
(GET-static "/blog"
            (content '(text/html)
                     (blog-template `((show-tags . #t)
                                      (feed . ,"/blog/atom.xml")
                                      (tags . ,(list->vector (map car tags)))
                                      (posts . ,(list->vector posts))))))
;; /blog/tags/*
(define (make-tag-pages tags posts)
  (for-each
   (lambda (tag)
     (define filtered (filter (lambda (post)
                                (vector-any (lambda (t) (eq? t tag)) (assoc-ref post 'tags)))
                              posts))

     (GET-static (string-append "/blog/tags/" (symbol->string tag))
                 (content '(text/html)
                          (blog-template `((selected-tag . ,tag)
                                           (posts . ,(list->vector filtered)))))))
   tags))

(make-tag-pages (map car tags) posts)
