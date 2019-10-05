(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(desktop-save-mode 1)

(toggle-frame-fullscreen)

(setq sml/no-confirm-load-theme t)
(sml/setup)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)


(when (fboundp 'winner-mode)
  (winner-mode 1))

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-11"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )


;; company
(use-package company
  :init
  (global-company-mode 1)
  (add-to-list 'company-backends '(company-capf :with company-files :sorted company-dabbrev)))
  ;;(delete 'company-semantic company-backends))
  ;; (add-to-list 'company-backends 'company-semantic)
  ;; (add-to-list 'company-backends 'company-clang)
;; (add-to-list 'company-backends 'company-gtags)

(defun c-c++-company-setup ()
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf :with company-files :sorted company-yasnippet))
  (add-to-list (make-local-variable 'company-backends)
                 '(company-irony-c-headers company-c-headers))
  ;; (add-to-list (make-local-variable 'company-backends)
  ;;              '(company-irony :sorted company-semantic))

  (add-to-list (make-local-variable 'company-backends)
               '(company-irony))
)


(add-hook 'c-mode-hook 'c-c++-company-setup)
(add-hook 'c++-mode-hook 'c-c++-company-setup)




;; ;;
;;(define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends '(company-irony-c-headers company-irony company-yasnippet company-rtags company-gtags company-semantic company-clang)
;;     )
;;   )


;; == company-mode ==
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (delete 'company-semantic 'company-backends)
;;   :config
;;   (use-package company-irony :ensure t :defer t)
;;   (setq company-idle-delay              nil
;;         company-minimum-prefix-length   2
;;         company-show-numbers            t
;;         company-tooltip-limit           20
;;         company-dabbrev-downcase        nil
;;         company-backends                '((company-irony company-clang company-semantic company-gtags))
;;         )
;;   :bind ("C-;" . company-complete-common)
;;   )

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))


(use-package helm-projectile
             :init
             (helm-projectile-on)
             (setq projectile-completion-system 'helm)
             (setq projectile-indexing-method 'alien)
             (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
             (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))



;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; highlight line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)


;; pdf tools
(pdf-tools-install)


;; linum
(global-linum-mode 1)
(add-hook 'pdf-view-mode-hook (lambda () (linum-mode -1)))
(setq linum-format "%4d \u2502")


;; rainbow
(require 'rainbow-delimiters)
(require 'rainbow-identifiers)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-identifiers-mode)


;; function-args
(require 'function-args)
(fa-config-default)


;; hideshow
(require 'hideshow)
(add-hook 'prog-mode-hook 'hs-minor-mode)


;; ranger
(require 'ranger)
(ranger-override-dired-mode t)


;; clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; drag stuff
(require 'drag-stuff)
(add-to-list 'drag-stuff-except-modes 'python-mode)
(drag-stuff-global-mode 1)
(setq drag-stuff-modifier 'meta)
(drag-stuff-define-keys)

(provide 'setup-general)
