(use-modules (schingle template mustache)
             (parameters))

(add-renderer ".mustache" (mustache-renderer *global-template-params*))
