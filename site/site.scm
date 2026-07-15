(use-modules (schingle template mustache)
             (schingle util)
             (markdown)
             (parameters))


(add-renderer ".md" markdown->html)
(add-renderer ".mustache" (mustache-renderer *global-template-params*))

(define md-template (mustache-compile "mdpage.mustache"))
(add-renderer ".page.md" (lambda (content)
                           (md-template `((body . ,(markdown->html (string/bytevector->string content)))))))
