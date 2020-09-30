(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)
(setq org-startup-truncated nil)


(setq org-directory (expand-file-name "~/org"))



(setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
        ))

(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("NEXT" . (:foreground "IndianRed1" :weight bold))
        ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold))
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (shell . t)))

(require 'ob-async)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "python")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


(setq org-babel-python-command "python3")


(eval-after-load 'org '(require 'org-pdfview))

(add-to-list 'org-file-apps
             '("\\.pdf\\'" . (lambda (file link)
                               (org-pdfview-open link))))


(defun ox-export-to-docx-and-open ()
  (interactive)
  (let* ((bibfile (expand-file-name (car (org-ref-find-bibliography))))
         ;; this is probably a full path
         (current-file (buffer-file-name))
         (basename (file-name-sans-extension current-file))
         (docx-file (concat basename ".docx")))
    (save-buffer)
    (when (file-exists-p docx-file) (delete-file docx-file))
    (shell-command (format
                    "pandoc -s -S --bibliography=%s %s -o %s"
                    bibfile current-file docx-file))
    (org-open-file docx-file '(16))))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'setup-org)
