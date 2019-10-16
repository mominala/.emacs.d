(require 'package)
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-check-signature nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defconst packages
  '(anzu
    auctex
    ag
    clean-aindent-mode
    clang-format
    cmake-mode
    cmake-ide
    comment-dwim-2
    company
    company-auctex
    company-c-headers
    company-irony
    company-irony-c-headers
    company-jedi
    company-math
    company-rtags
    company-bibtex
    cython-mode
    slime-company
    duplicate-thing
    dtrt-indent
    docker
    dockerfile-mode
    drag-stuff
    ecb
    eglot
    ess
    expand-region
    exec-path-from-shell
    evil
    eldoc
    ;; exwm
    ;; exwm-edit
    elpy
    flycheck
    flycheck-rtags
    flycheck-irony
    function-args
    ggtags
    github-search
    git-timemachine
    gscholar-bibtex
    haskell-mode
    helm
    helm-ag
    helm-gtags
    helm-projectile
    helm-swoop
    helm-rtags
    helm-bibtex
    hydra
    iedit
    irony
    irony-eldoc
    jedi
    key-chord
    latex-preview-pane
    magit
    markdown-mode
    modern-cpp-font-lock
    multiple-cursors
    multi-term
    projectile
    protobuf-mode
    pdf-tools
    pydoc-info
    rtags
    rainbow-delimiters
    rainbow-identifiers
    ranger
    scion
    smartparens
    smart-mode-line
    srefactor
    slime
    spacemacs-theme
    tuareg
    undo-tree
    use-package
    volatile-highlights
    vdiff
    ws-butler
    xah-lookup
    yasnippet-snippets
    yasnippet
    zygospore
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(add-to-list 'exec-path "~/.local/bin")


;; (require 'setup-exwm)
 (require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-rtags)
(require 'setup-editing)
(require 'setup-general)
;; (require 'setup-cedet)
;; (require 'setup-c)
(require 'setup-eglot)
(require 'setup-python)
(require 'setup-tex)
;; (require 'setup-lisp)
(require 'setup-hydra)
(require 'setup-org)
(require 'setup-ranger)
(require 'setup-lookup)
(require 'setup-compilation)

;; theme
(load-theme 'smart-mode-line-dark t)
(load-theme 'spacemacs-dark t)


(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
(server-start)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(helm-ff-lynx-style-map t)
 '(helm-imenu-lynx-style-map t)
 '(helm-occur-use-ioccur-style-keys t)
 '(helm-semantic-lynx-style-map t t)
 '(package-selected-packages
   (quote
    (cmake-ide cython-mode ag protobuf-mode zygospore yasnippet-snippets xah-lookup ws-butler vdiff volatile-highlights use-package tuareg spacemacs-theme srefactor smart-mode-line smartparens scion ranger rainbow-identifiers rainbow-delimiters pydoc-info pdf-tools multi-term multiple-cursors modern-cpp-font-lock markdown-mode latex-preview-pane key-chord jedi irony-eldoc iedit hydra helm-bibtex helm-rtags helm-swoop helm-projectile helm-gtags helm-ag helm haskell-mode gscholar-bibtex git-timemachine github-search ggtags function-args flycheck-irony flycheck-rtags flycheck evil exec-path-from-shell expand-region ess ecb drag-stuff dockerfile-mode docker dtrt-indent duplicate-thing slime-company company-bibtex company-rtags company-math company-jedi company-irony-c-headers company-irony company-c-headers company-auctex company comment-dwim-2 cmake-mode clang-format clean-aindent-mode auctex anzu)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
