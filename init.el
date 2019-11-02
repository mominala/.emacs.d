(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defconst packages
  '(anzu
    ag
    auctex
    clean-aindent-mode
    clang-format
    circe
    cmake-mode
    cmake-ide
    comment-dwim-2
    company
    company-auctex
    company-c-headers
    company-coq
    company-irony
    company-irony-c-headers
    company-jedi
    company-math
    company-rtags
    company-bibtex
    company-shell
    slime-company
    duplicate-thing
    dtrt-indent
    docker
    dockerfile-mode
    drag-stuff
    ecb
    ess
    ein
    expand-region
    exec-path-from-shell
    evil
    eldoc
    eglot
    exwm
    exwm-edit
    elpy
    flycheck
    flycheck-rtags
    flycheck-irony
    flymake-shellcheck
    function-args
    ggtags
    github-search
    git-gutter
    git-timemachine
    gscholar-bibtex
    general
    haskell-mode
    helm
    helm-ag
    helm-gtags
    helm-projectile
    helm-swoop
    helm-rtags
    helm-bibtex
    highlight-indent-guides
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
    ob-ipython
    projectile
    protobuf-mode
    proof-general
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
    sphinx-doc
    tuareg
    merlin
    undo-tree
    use-package
    volatile-highlights
    vdiff
    ws-butler
    which-key
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


(require 'setup-exwm)
(require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-rtags)
;; (require 'setup-c)
(require 'setup-general)
(require 'setup-editing)
(require 'setup-eglot)
;; (require 'setup-cedet)
(require 'setup-python)
(require 'setup-tex)
(require 'setup-lisp)
(require 'setup-hydra)
(require 'setup-org)
(require 'setup-ranger)
(require 'setup-lookup)
(require 'setup-shell)
(require 'setup-ocaml)

;; theme
(load-theme 'smart-mode-line-dark t)
(load-theme 'spacemacs-dark t)




(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
(server-start)
