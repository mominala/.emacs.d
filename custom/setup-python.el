;;pydoc-info
(require 'pydoc-info)
(info-lookup-add-help
 :mode 'python-mode
 :parse-rule 'pydoc-info-python-symbol-at-point
 :doc-spec
 '(("(python)Index" pydoc-info-lookup-transform-entry)
   ("(TARGETNAME)Index" pydoc-info-lookup-transform-entry)))

;; elpy
(elpy-enable)


(provide 'setup-python)
