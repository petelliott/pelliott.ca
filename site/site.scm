(use-modules (schingle template mustache)
             (markdown)
             (parameters))


(add-renderer ".md" markdown->html)
(add-renderer ".mustache" (mustache-renderer *global-template-params*))
