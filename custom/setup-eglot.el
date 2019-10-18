(require 'eglot)
(require 'cc-mode)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd" "-background-index"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(add-hook 'c-mode-common-hook 'hs-minor-mode)

(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ipp\\'" . c++-mode))


(defun c-c++-company-setup ()
  (delete 'company-clang company-backends)
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf :separate company-files company-yasnippet))
  )




(add-hook 'c-mode-hook 'c-c++-company-setup)
(add-hook 'c++-mode-hook 'c-c++-company-setup)


(define-key c-mode-base-map (kbd "M-.") 'xref-find-definitions)
(define-key c-mode-base-map (kbd "M-,") 'xref-find-references)
(define-key c-mode-base-map (kbd "M-*") 'xref-pop-marker-stack)
(define-key c-mode-base-map (kbd "M-i") 'helm-semantic-or-imenu)
(define-key c-mode-base-map (kbd "<f7>") 'clang-format-buffer)

(provide 'setup-eglot)
