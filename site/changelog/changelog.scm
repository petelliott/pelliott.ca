(use-modules (parameters)
             (pagination)
             (schingle load)
             (ice-9 rdelim)
             (ice-9 regex))

(define (changelog-line str)
  (define match (string-match "([^ ]*) (.*)" str))
  `((date . ,(match:substring match 1))
    (text . ,(match:substring match 2))))

(define (read-changelog port)
  (define line (read-line port))
  (if (eof-object? line)
      '()
      (cons (changelog-line line)
            (read-changelog port))))

(define (load-changelog file)
  (call-with-schingle-input-file file
    (lambda (port)
      (read-changelog port))))

(define changelog (load-changelog "CHANGELOG"))
(write changelog)
(newline)
(add-global-template-parameter 'changelog `((all . ,(list->vector changelog))
                                            (top10 . ,(list->vector (topn changelog 10)))))
