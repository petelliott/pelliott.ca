(use-modules (parameters)
             (feedfile))

(define statuses (load-feedfile "STATUS"))

;; END STATUSES

(add-global-template-parameter 'status `((current . ,(car statuses))
                                         (old . ,(list->vector (cdr statuses)))))
