(define-module (parameters)
  #:export (*global-template-params*
            add-global-template-parameter))

(define *global-template-params* (make-parameter '()))

(define (add-global-template-parameter key value)
  (*global-template-params* (acons key value (*global-template-params*))))
