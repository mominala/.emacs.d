(require 'package)
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-check-signature nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defconst packages
  '(anzu
    ag
    auctex
    avy
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
    dumb-jump
    slime-company
    dired-narrow
    duplicate-thing
    dtrt-indent
    docker
    dockerfile-mode
    drag-stuff
    ecb
    ereader
    ess
    ;;ein
    expand-region
    exec-path-from-shell
    evil
    evil-tutor
    eldoc
    elfeed
    eglot
    ;;exwm
    ;;exwm-edit
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
    ;; general
    haskell-mode
    helm
    helm-ag
    helm-gtags
    helm-projectile
    helm-swoop
    helm-rtags
    helm-bibtex
    helm-recoll
    highlight-indent-guides
    hydra
    iedit
    irony
    irony-eldoc
    ivy
    jedi
    key-chord
    latex-preview-pane
    magit
    markdown-mode
    markdown-preview-mode
    modern-cpp-font-lock
    multiple-cursors
    multi-term
    origami
    ob-ipython
    ob-async
    org-bullets
    org-pdfview
    org-noter
    org-ref
    projectile
    protobuf-mode
    proof-general
    pdf-tools
    pydoc
    pydoc-info
    plantuml-mode
    rtags
    rainbow-delimiters
    rainbow-identifiers
    ranger
    shr
    scion
    smartparens
    smart-mode-line
    srefactor
    slime
    spacemacs-theme
    sphinx-doc
    tuareg
    texfrag
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
    yaml-mode
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
(require 'setup-helm-gtags)
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
(require 'setup-shell)
(require 'setup-elfeed)

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
 '(git-gutter:update-interval 2)
 '(helm-ff-lynx-style-map t)
 '(helm-imenu-lynx-style-map t t)
 '(helm-occur-use-ioccur-style-keys t)
 '(helm-semantic-lynx-style-map t t)
 '(package-selected-packages
   (quote
    (yaml-mode ob-typescript typescript-mode python-mode org-ref ob-async elfeed markdown-preview-mode pydoc plantuml-mode use-package-chords ein ereader dired-narrow dumb-jump company-shell company-coq circe avy helm-xref highlight-indent-guides fill-column-indicator sphinx-doc cmake-ide cython-mode ag protobuf-mode zygospore yasnippet-snippets xah-lookup ws-butler vdiff volatile-highlights use-package tuareg spacemacs-theme srefactor smart-mode-line smartparens scion ranger rainbow-identifiers rainbow-delimiters pydoc-info pdf-tools multi-term multiple-cursors modern-cpp-font-lock markdown-mode latex-preview-pane key-chord jedi irony-eldoc iedit hydra helm-bibtex helm-rtags helm-swoop helm-projectile helm-gtags helm-ag helm haskell-mode gscholar-bibtex git-timemachine github-search ggtags function-args flycheck-irony flycheck-rtags flycheck evil exec-path-from-shell expand-region ess ecb drag-stuff dockerfile-mode docker dtrt-indent duplicate-thing slime-company company-bibtex company-rtags company-math company-jedi company-irony-c-headers company-irony company-c-headers company-auctex company comment-dwim-2 cmake-mode clang-format clean-aindent-mode auctex anzu)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
