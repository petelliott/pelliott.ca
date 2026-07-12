(use-modules (parameters))

(define *statuses* (make-parameter '()))

(define (status date text)
  (*statuses* (cons `((date . ,date)
                      (text . ,text))
                    (*statuses*))))


;; BEGIN STATUSES

(status "2026-06-12" "working on my website")

;; END STATUSES

(add-global-template-parameter 'status `((current . ,(car (*statuses*)))
                                         (old . ,(list->vector (cdr (*statuses*))))))
