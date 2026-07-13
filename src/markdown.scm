(define-module (markdown)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 textual-ports)
  #:export (markdown->html
            inline-markdown->html))

(define pandoc-command "")

(define (markdown->html content)
  (define-values (in out pids) (pipeline '(("pandoc" "-f" "markdown" "-t" "html"))))
  (display content out)
  (close-port out)
  (define html (get-string-all in))
  (close-port in)
  (waitpid (car pids))
  html)

(define inline-md-regex (make-regexp "</? *p *>"))

(define (inline-markdown->html content)
  (regexp-substitute/global #f inline-md-regex (markdown->html content)
                            'pre "" 'post))
