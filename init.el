(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defconst packages
  '(anzu
    auctex
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
    slime-company
    duplicate-thing
    dtrt-indent
    dockerfile-mode
    ecb
    ess
    expand-region
    evil
    eldoc
    exwm
    exwm-edit
    elpy
    flycheck
    flycheck-rtags
    flycheck-irony
    function-args
    ggtags
    github-search
    git-timemachine
    haskell-mode
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    helm-rtags
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
    projectile
    pdf-tools
    pydoc-info
    rtags
    rainbow-delimiters
    rainbow-identifiers
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

(require 'setup-exwm)
(require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
(require 'setup-rtags)
(require 'setup-editing)
(require 'setup-general)
(require 'setup-c)
;; (require 'setup-cedet)
(require 'setup-python)
(require 'setup-tex)
(require 'setup-lisp)
(require 'setup-hydra)


;; theme
(load-theme 'smart-mode-line-dark t)
(load-theme 'spacemacs-dark t)


(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
(server-start)
