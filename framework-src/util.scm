(use-modules (ice-9 textual-ports))

(define (paste-path basepath path)
  (if (absolute-file-name? path)
      path
      (in-vicinity basepath path)))

(define (paste-rel basepath path)
  (define abspath (paste-path basepath path))
  (call-with-input-file abspath
    (lambda (port)
      (put-string (current-output-port) (get-string-all port)))))

(define-syntax paste
  (syntax-rules ()
    ((_ path) (paste-rel (dirname (current-filename)) path))))
