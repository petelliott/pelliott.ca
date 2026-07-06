(use-modules (schingle template mustache)
             (ice-9 popen)
             (ice-9 textual-ports)
             (parameters))

(define (markdown->html content)
  (define-values (in out pids) (pipeline '(("pandoc" "-f" "markdown" "-t" "html"))))
  (display content out)
  (close-port out)
  (define html (get-string-all in))
  (close-port in)
  (waitpid (car pids))
  html)


(add-renderer ".md" markdown->html)
(add-renderer ".mustache" (mustache-renderer *global-template-params*))
