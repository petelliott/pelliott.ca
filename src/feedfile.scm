(define-module (feedfile)
  #:use-module (markdown)
  #:use-module (schingle load)
  #:use-module (ice-9 rdelim)
  #:use-module (ice-9 regex)
  #:export (read-feedfile
            load-feedfile))

(define (feedfile-line str)
  (define match (string-match "([^ ]*) (.*)" str))
  `((date . ,(match:substring match 1))
    (text . ,(inline-markdown->html (match:substring match 2)))))

(define (read-feedfile port)
  (define line (read-line port))
  (if (eof-object? line)
      '()
      (cons (feedfile-line line)
            (read-feedfile port))))

(define (load-feedfile file)
  (call-with-schingle-input-file file
    (lambda (port)
      (read-feedfile port))))
