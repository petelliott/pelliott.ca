(use-modules (ice-9 popen))

(define from "info@mail.pelliott.ca")
(define to "info@pelliott.ca")

(POST "/forms/contact"
      (lambda (request body)
        (define name (or (assoc-ref body "name") ""))
        (define email (or (assoc-ref body "email") ""))
        (define website (or (assoc-ref body "website") ""))
        (define subject (or (assoc-ref body "subject") ""))
        (define content (or (assoc-ref body "body") ""))

        (define mail-command (list "mail"
                                   "-r" from
                                   "-s" (format #f "[contact] ~a" subject)
                                   "-a" (format #f "Reply-To: ~a" email)
                                   to))
        (display "sending contact form email\n")
        (define-values (in out pids) (pipeline (list mail-command)))
        (format out "name: ~a\nemail: ~a\nwebsite: ~a\n--------------------------------\n"
                name email website)
        (display content out)

        (close-port out)
        (close-port in)

        (define status (waitpid (car pids)))
        (display "mail exited with: ")
        (display status)
        (newline)
        (redirect 303 "/contact/submitted")))
