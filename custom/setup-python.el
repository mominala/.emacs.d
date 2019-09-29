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

(custom-set-variables
 '(elpy-rpc-python-command "python3")
 '(python-shell-interpreter "~/.local/bin/tf"))



(provide 'setup-python)
