(require 'rtags)
(require 'helm)
(require 'ggtags)
(require 'helm-gtags)


(rtags-enable-standard-keybindings)
(setq rtags-display-result-backend 'helm)
(setq rtags-imenu-syntax-highlighting t)



(defun gtags-get-rootpath ()
  (let (path buffer)
    (save-excursion
      (setq buffer (generate-new-buffer (generate-new-buffer-name "*rootdir*")))
      (set-buffer buffer)
      (setq n (call-process "global" nil t nil "-pr"))
      (if (= n 0)
          (setq path (file-name-as-directory (buffer-substring (point-min)(1- (point-max))))))
      (kill-buffer buffer))
    path))


(defun use-rtags (&optional useFileManager)
  (and (rtags-executable-find "rc")
       (cond ((not (gtags-get-rootpath)) t)
             ((and (not (eq major-mode 'c++-mode))
                   (not (eq major-mode 'c-mode))) (rtags-has-filemanager))
             (useFileManager (rtags-has-filemanager))
             (t (rtags-is-indexed)))))


;; (defun tags-find-symbol-at-point (&optional prefix)
;;   (interactive "P")
;;   (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
;;       (ggtags-find-tag)))
;; (defun tags-find-references-at-point (&optional prefix)
;;   (interactive "P")
;;   (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
;;       (ggtags-find-reference)))
;; (defun tags-find-symbol ()
;;   (interactive)
;;   (call-interactively (if (use-rtags) 'rtags-find-symbol 'ggtags-find-other-symbol)))
;; (defun tags-find-references ()
;;   (interactive)
;;   (call-interactively (if (use-rtags) 'rtags-find-references 'ggtags-find-reference)))
;; (defun tags-find-file ()
;;   (interactive)
;;   (call-interactively (if (use-rtags t) 'rtags-find-file 'ggtags-find-file)))
;; (defun tags-imenu ()
;;   (interactive)
;;   (call-interactively (if (use-rtags t) 'rtags-imenu 'idomenu)))



(defun tags-find-symbol-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
      (helm-gtags-dwim)))
(defun tags-find-references-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
      (helm-gtags-dwim)))
(defun tags-find-symbol ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-symbol 'helm-gtags-find-symbol)))
(defun tags-find-references ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-references 'helm-gtags-find-pattern)))
(defun tags-find-file ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-find-file 'helm-gtags-find-files)))
(defun tags-pop-stack ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-location-stack-back 'helm-gtags-pop-stack)))
(defun tags-imenu ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-imenu 'helm-imenu)))




(define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-*") (function tags-pop-stack))
(define-key c-mode-base-map (kbd "M-^") (function tags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function tags-imenu))
(define-key c-mode-base-map (kbd "C-M-i") (function rtags-find-symbol))

;; (define-key global-map (kbd "M-.") (function tags-find-symbol-at-point))
;; (define-key global-map (kbd "M-,") (function tags-find-references-at-point))
;; (define-key global-map (kbd "M-*") (function tags-pop-stack))
;; (define-key global-map (kbd "M-^") (function tags-find-file))
;; (define-key global-map (kbd "C-.") (function tags-find-symbol))
;; (define-key global-map (kbd "C-,") (function tags-find-references))
;; (define-key global-map (kbd "C-<") (function rtags-find-virtuals-at-point))
;; (define-key global-map (kbd "M-i") (function tags-imenu))


(provide 'setup-rtags)
