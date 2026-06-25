
(define-syntax define-component
  (syntax-rules ()
    ((_ (name (arg ...) . body) block ...)
     (begin
       (define (component-proc arg ... body)
         block ...)
       (define-syntax name
         (syntax-rules ::: ()
           ((_ (arg2 :::) body2 :::)
            (component-proc arg2 ::: (lambda () body2 :::)))))))))
