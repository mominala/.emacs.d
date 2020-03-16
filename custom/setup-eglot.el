(require 'eglot)
(require 'cc-mode)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "mclangd"))
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
               '(company-capf company-files :separate company-yasnippet))
  )




(add-hook 'c-mode-hook 'c-c++-company-setup)
(add-hook 'c++-mode-hook 'c-c++-company-setup)

(defun dynamic-xref-apropos ()
  (interactive)
  (let ((buf (current-buffer)))
    (ivy-read "Search for pattern: "
              (lambda (str)
                (cond
                 ((< (length str) 1) nil)
                 (t
                  (with-current-buffer buf
                    (when-let ((backend (xref-find-backend)))
                      (unless (eq backend 'etags)
                        (mapcar
                         (lambda (xref)
                           (let ((loc (xref-item-location xref)))
                             (propertize
                              (concat
                               (when (xref-file-location-p loc)
                                 (with-slots (file line column) loc
                                   (format "%s:%s:%s:"
                                           (propertize (file-relative-name file)
                                                       'face 'compilation-info)
                                           (propertize (format "%s" line)
                                                       'face 'compilation-line
                                                       )
                                           column)))
                               (xref-item-summary xref))
                              'xref xref)))
                         (xref-backend-apropos backend str))))))))
              :dynamic-collection t
              :action (lambda (item)
                        (xref--pop-to-location (get-text-property 0 'xref item))))))


(define-key c-mode-base-map (kbd "M-,") 'xref-find-references)
(define-key c-mode-base-map (kbd "M-.") 'xref-find-definitions)
(define-key c-mode-base-map (kbd "M-*") 'xref-pop-marker-stack)
(define-key c-mode-base-map (kbd "M-i") 'helm-semantic-or-imenu)
(define-key c-mode-base-map (kbd "C-M-w") 'dynamic-xref-apropos)



(provide 'setup-eglot)
