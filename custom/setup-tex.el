;; auto completion for auctex using company
(require 'company-auctex)
(require 'company-math)
(require 'company-bibtex)
(require 'helm-bibtex)



(autoload 'helm-bibtex "helm-bibtex" "" t)

(setq org-latex-prefer-user-labels t)
(setq reftex-default-bibliography '("~/Bibliography/references.bib"))

;;see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Bibliography/notes.org"
     org-ref-default-bibliography '("~/Bibliography/references.bib")
     org-ref-pdf-directory "~/Bibliography/pdfs/")



;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

(setq bibtex-completion-bibliography "~/Bibliography/references.bib"
      bibtex-completion-library-path "~/Bibliography/pdfs/"
      bibtex-completion-notes-path "~/Bibliography/helm-bibtex-notes")


(setq bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))


(add-to-list 'TeX-command-list `("Viewer" ,(concat "emacsclient -s" (format " /tmp/emacs%d/server" (user-uid)) " -e '(find-file-other-window (concat (file-name-directory (buffer-file-name (get-buffer \"%s.tex\"))) \"%s.pdf\"))'") TeX-run-discard-or-function t t :help "View in buffer"))


(setq texfrag-global-mode 1)

;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-auctex-labels company-auctex-bibs company-auctex-macros company-auctex-environments))
                      company-backends)))

(add-hook 'TeX-mode-hook 'my-latex-mode-setup)



(provide 'setup-tex)
