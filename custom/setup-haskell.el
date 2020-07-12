(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . ("ghcide" "--lsp"))))
(provide 'setup-haskell)

