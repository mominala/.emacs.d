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
             '(font . "DejaVu Sans Mono-10"))

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
  (add-to-list 'company-backends '(company-capf :sorted company-files company-dabbrev)))
  ;;(delete 'company-semantic company-backends))
  ;; (add-to-list 'company-backends 'company-semantic)
  ;; (add-to-list 'company-backends 'company-clang)
;; (add-to-list 'company-backends 'company-gtags)

;; (defun c-c++-company-setup ()
;;   (add-to-list (make-local-variable 'company-backends)
;;                '(company-capf :with company-files :sorted company-yasnippet))
;;   (add-to-list (make-local-variable 'company-backends)
;;                  '(company-irony-c-headers company-c-headers))
;;   ;; (add-to-list (make-local-variable 'company-backends)
;;   ;;              '(company-irony :sorted company-semantic))

;;   (add-to-list (make-local-variable 'company-backends)
;;                '(company-irony))
;; )


;; (add-hook 'c-mode-hook 'c-c++-company-setup)
;; (add-hook 'c++-mode-hook 'c-c++-company-setup)




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
(global-display-line-numbers-mode t)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'comint-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'term-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t)))
(setq display-line-numbers "%4d \u2502 ")


(set-fringe-style '(0 . 0))

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
(add-to-list 'drag-stuff-except-modes 'org-mode)
(drag-stuff-global-mode 1)
(setq drag-stuff-modifier 'meta)
(drag-stuff-define-keys)


;; which-key
(which-key-mode)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; dired
(use-package dired-narrow
  :ensure t
  :config
  (bind-key "C-c C-n" #'dired-narrow)
  (bind-key "C-c C-f" #'dired-narrow-fuzzy)
  (bind-key "C-c C-N" #'dired-narrow-regexp))


;; dump jump
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  ;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )


(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))
;; avy

(use-package avy
  :ensure t
  :chords ("jh" . avy-goto-word-1)) ;; changed from char as per jcs


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc -s --mathjax -c ~/styles/gfm.css -t html5")
  (setq markdown-preview-stylesheets '("~/styles/gfm.css"))
  ;; (add-hook 'markdown-mode-hook #'markdown-preview-mode)
  ;; (setq markdown-enable-math t)
  ;; (setq markdown-css-paths
        ;; '("https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css"))
  ;; (setq markdown-xhtml-header-content
  ;;       (concat "<script type=\"text/javascript\" async"
  ;;               " src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/"
  ;;               "2.7.1/MathJax.js?config=TeX-MML-AM_CHTML\">"
  ;;               "</script>"))
  )

(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(provide 'setup-general)
