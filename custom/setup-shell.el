(defun sh-company-setup ()
  (add-to-list (make-local-variable 'company-backends)
               '(company-shell company-shell-env company-fish-shell :with company-capf company-files company-dabbrev))
  )


(add-hook 'sh-mode-hook 'sh-company-setup)


(use-package flymake-shellcheck
  :commands flymake-shellcheck-load
  :init
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load)
  (add-hook 'sh-mode-hook 'flymake-mode))


(provide 'setup-shell)
