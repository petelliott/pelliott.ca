(define (dep-path searchdir path)
  (if (absolute-file-name? path)
      path
      (in-vicinity searchdir path)))

(define required-files (make-parameter '()))

(define (require-in searchdir path)
  (define fullpath (dep-path searchdir path))
  (unless (member fullpath (required-files))
    (load fullpath)
    (required-files (cons fullpath (required-files)))))

(define-syntax require
  (syntax-rules ()
    ((_ path) (require-in (dirname (current-filename)) path))))
