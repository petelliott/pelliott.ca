(define-module (pagination)
  #:export(topn))

(define (topn list n)
  (if (or (null? list) (<= n 0))
      '()
      (cons (car list)
            (topn (cdr list) (1- n)))))
