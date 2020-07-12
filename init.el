(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
    ein
    expand-region
    exec-path-from-shell
    evil
    evil-tutor
    eldoc
    elfeed
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
    helm-recoll
    helm-lsp
    highlight-indent-guides
    hydra
    iedit
    impatient-mode
    irony
    irony-eldoc
    ivy
    jedi
    key-chord
    latex-preview-pane
    lsp-mode
    lsp-haskell
    lsp-ui
    magit
    markdown-mode
    markdown-preview-mode
    modern-cpp-font-lock
    multiple-cursors
    multi-term
    origami
    ob-ipython
    org-bullets
    org-pdfview
    org-noter
    org-ref
    projectile
    protobuf-mode
    proof-general
    pdf-tools
    pydoc-info
    rtags
    rainbow-delimiters
    rainbow-identifiers
    ranger
    restclient
    shr
    scion
    simple-httpd
    smartparens
    smart-mode-line
    srefactor
    slime
    spacemacs-theme
    sphinx-doc
    swiper-helm
    tuareg
    texfrag
    merlin
    undo-tree
    use-package
    volatile-highlights
    vdiff
    ws-butler
    web-mode
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
(add-to-list 'load-path "~/.emacs.d/aweshell")
(add-to-list 'load-path "~/.emacs.d/emacs-application-framework")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(add-to-list 'exec-path "~/.local/bin")


(require 'setup-general)
(require 'setup-exwm)
(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-rtags)
;; (require 'setup-c)
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
(require 'setup-recoll)
(require 'setup-statistics)
(require 'setup-haskell)
(require 'setup-eaf)
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
 '(coq-prog-name (expand-file-name "~/.opam/4.08.1/bin/coqtop"))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(eaf-find-alternate-file-in-dired t t)
 '(elpy-rpc-python-command "python3")
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (restclient auctex texfrag w3m elfeed impatient-mode markdown-preview-mode lsp-haskell company-ghc web-mode evil-tutor origami org-ref avy dumb-jump org-bullets ivy swiper-helm dired-narrow org-noter helm-recoll zygospore yasnippet-snippets xah-lookup ws-butler which-key volatile-highlights vdiff use-package tuareg srefactor sphinx-doc spacemacs-theme smartparens smart-mode-line slime-company scion ranger rainbow-identifiers rainbow-delimiters pydoc-info protobuf-mode proof-general pdf-tools ob-ipython multiple-cursors multi-term modern-cpp-font-lock merlin latex-preview-pane key-chord jedi irony-eldoc iedit highlight-indent-guides helm-xref helm-swoop helm-rtags helm-projectile helm-gtags helm-bibtex helm-ag haskell-mode gscholar-bibtex github-search git-timemachine git-gutter ggtags general function-args flymake-shellcheck flycheck-rtags flycheck-irony exwm-edit exwm expand-region exec-path-from-shell evil ess elpy ein eglot ecb duplicate-thing dtrt-indent drag-stuff dockerfile-mode docker company-shell company-rtags company-jedi company-irony-c-headers company-irony company-coq company-c-headers company-bibtex company-auctex comment-dwim-2 cmake-mode cmake-ide clean-aindent-mode clang-format circe anzu ag)))
 '(proof-three-window-enable t)
 '(python-shell-completion-native-enable nil)
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
