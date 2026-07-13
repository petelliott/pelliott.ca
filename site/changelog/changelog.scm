(use-modules (parameters)
             (pagination)
             (feedfile))

(define changelog (load-feedfile "CHANGELOG"))

(add-global-template-parameter 'changelog `((all . ,(list->vector changelog))
                                            (top10 . ,(list->vector (topn changelog 10)))))
