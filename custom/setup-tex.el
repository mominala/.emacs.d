;; auto completion for auctex using company
(require 'company-auctex)
(require 'company-math)




(add-to-list 'TeX-command-list (quote ("Viewer" "emacsclient -s (format \"/tmp/emacs%d/server\" (user-uid)) -e '(find-file-other-window (concat (file-name-directory (buffer-file-name (get-buffer \"%s.tex\"))) \"/%s.pdf\"))'" TeX-run-discard-or-function t t :help "View in buffer")))

;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-auctex-labels company-auctex-bibs company-auctex-macros company-auctex-environments))
                      company-backends)))

(add-hook 'TeX-mode-hook 'my-latex-mode-setup)



(provide 'setup-tex)
