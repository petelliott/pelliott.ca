(use-modules (ice-9 ftw)
             (srfi srfi-13))

(define (relativize root path)
  (string-trim (string-drop path (string-length (string-trim-right root #\/))) #\/))

(define (build-file src dst)
  (with-output-to-file dst
    (lambda ()
      (load (canonicalize-path src)))))

(define (build src dest)
  (system* "rm" "-rf" dest)
  (ftw src
       (lambda (filename statinfo flag)
         (define rel (relativize src filename))
         (display rel)
         (newline)
         (case flag
           ((directory)
            (mkdir (in-vicinity dest rel)))
           ((regular)
            (if (string-suffix? ".scm" filename)
                (build-file filename (in-vicinity dest (basename filename ".scm")))
                (copy-file filename
                           (in-vicinity dest rel))))
           ((symlink) #f)
           (else
            (error "unknown ftw flag" flag filename)))
         #t)))
