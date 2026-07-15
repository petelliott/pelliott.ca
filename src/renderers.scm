(define-module (renderers)
  #:use-module (schingle template mustache)
  #:use-module (schingle render)
  #:use-module (schingle util)
  #:use-module (markdown)
  #:use-module (parameters))

(add-renderer ".md" markdown->html)
(add-renderer ".mustache" (mustache-renderer *global-template-params*))

(define md-template (mustache-compile "mdpage.mustache"))
(add-renderer ".page.md" (lambda (content)
                           (md-template `((body . ,(markdown->html (string/bytevector->string content)))))))
