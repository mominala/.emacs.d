

(defun sh-company-setup ()
  (add-to-list (make-local-variable 'company-backends)
               '(company-shell company-shell-env company-fish-shell :with company-capf company-files company-dabbrev))
  )

(add-hook 'sh-mode-hook 'sh-company-setup)
(add-hook 'sh-mode-hook 'flymake-mode)

;; (use-package lsp-mode
;;   :commands lsp
;;   :hook
;;   (sh-mode . lsp))


(require 'eglot)
(require 'project)
(add-to-list 'eglot-server-programs '(shell-script-mode . ("bash-language-server")))




(provide 'setup-shell)
