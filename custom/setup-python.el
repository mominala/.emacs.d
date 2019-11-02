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
 '(python-shell-interpreter "python3")
 '(python-shell-completion-native-enable nil))



;; sphinx doc
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))


(provide 'setup-python)
