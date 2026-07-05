(use-modules (schingle template mustache)
             (schingle load)
             (schingle ftypes)
             (ice-9 ftw)
             (ice-9 regex)
             (ice-9 textual-ports))

(define blog-dir (schingle-resolve-path "blog/"))

(define (slug path)
  (basename path (full-file-extension path)))

(define (meta-for-render meta)
  (map (lambda (kv)
         (case (car kv)
           ((date)
            (cons (car kv)
                  (match:prefix (string-match "T" (cdr kv)))))
           (else
            kv)))
       meta))


(define blog-post-template (mustache-compile "blog-post.mustache"))
(define (meta-and-content url path)
  (call-with-input-file path
    (lambda (port)
      (define meta (read port))
      (define post (get-string-all port))
      (GET-static url (content '(text/html)
                               (blog-post-template (acons 'content post (meta-for-render meta)))))
      (acons 'url url meta))))

(define (serve-post path)
  (define url (string-append "/blog/" (slug path)))
  (if (file-is-directory? path)
      (begin
        (meta-and-content url (in-vicinity path "index.md")))
      (meta-and-content url path)))

(define posts
  (stable-sort
   (map
    (lambda (path) (serve-post (in-vicinity blog-dir path)))
    (scandir blog-dir (lambda (path) (not (string-prefix? "." path)))))
   (lambda (a b)
     (string>? (assoc-ref a 'date)
               (assoc-ref b 'date)))))


(write posts)
(newline)

(define posts-for-render
  (map meta-for-render posts))

(define blog-template (mustache-compile "blog.mustache"))
(GET-static "/blog"
            (content '(text/html)
                     (blog-template `((posts . ,(list->vector posts-for-render))))))
