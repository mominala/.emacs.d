
(require 'company)
(require 'company-c-headers)
(require 'cc-mode)

;;(add-to-list 'company-backends 'company-c-headers)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
;; (setq c-default-style "linux") ;; set style to "linux"


;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ipp\\'" . c++-mode))


(require 'rtags)
(cmake-ide-setup)


(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'c++-mode-hook 'flycheck-mode) (add-hook 'c-mode-hook 'flycheck-mode) (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'irony-mode-hook 'irony-eldoc)



(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))





;; =============
;; irony-mode
;; =============
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;; std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; =============
;; flycheck-mode
;; =============
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; =============
;; eldoc-mode
;; =============
(add-hook 'irony-mode-hook 'irony-eldoc)
;; ==========================================
;; (optional) bind TAB for indent-or-complete
;; ==========================================
(defun irony--check-expansion ()
  (save-excursion (if (looking-at "\\_>") t (backward-char 1) (if (looking-at "\\.") t (backward-char 1) (if (looking-at "->") t nil)))))
(defun irony--indent-or-complete () "Indent or Complete"
       (interactive) (cond
                      ((and (not (use-region-p))
                            (irony--check-expansion))
                       (message "complete")
                       (company-complete-common))
                      (t (message "indent") (call-interactively 'c-indent-line-or-region))))
(defun irony-mode-keys () "Modify keymaps used by `irony-mode'."
       (local-set-key (kbd "TAB") 'irony--indent-or-complete)
       (local-set-key [tab] 'irony--indent-or-complete))
(add-hook 'c-mode-common-hook 'irony-mode-keys)

(defun c-c++-company-setup ()
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf :with company-files :sorted company-yasnippet))
  (add-to-list (make-local-variable 'company-backends)
               '(company-irony-c-headers company-c-headers))
  (add-to-list (make-local-variable 'company-backends)
               '(company-irony))
  )


(add-hook 'c-mode-hook 'c-c++-company-setup)
(add-hook 'c++-mode-hook 'c-c++-company-setup)



(c-add-style "NETATMO"
             '("linux"
               (c-basic-offset . 2)     ; Guessed value
               (c-offsets-alist
                (access-label . *)      ; Guessed value
                (arglist-cont . 0)      ; Guessed value
                (arglist-intro . ++)    ; Guessed value
                (block-close . 0)       ; Guessed value
                (brace-list-close . 0)  ; Guessed value
                (brace-list-entry . 7)  ; Guessed value
                (brace-list-intro . +)  ; Guessed value
                (class-close . 0)       ; Guessed value
                (defun-block-intro . +) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (extern-lang-close . 0) ; Guessed value
                (inclass . +)           ; Guessed value
                (inextern-lang . 0)     ; Guessed value
                (innamespace . 0)           ; Guessed value
                (member-init-cont . 0)  ; Guessed value
                (member-init-intro . ++)    ; Guessed value
                (namespace-close . 0)   ; Guessed value
                (statement . 0)         ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (statement-cont . ++)       ; Guessed value
                (stream-op . 8)         ; Guessed value
                (topmost-intro . +)     ; Guessed value
                (topmost-intro-cont . 0) ; Guessed value
                (annotation-top-cont . 0)
                (annotation-var-cont . +)
                (arglist-close . c-lineup-close-paren)
                (arglist-cont-nonempty . c-lineup-arglist)
                (block-open . 0)
                (brace-entry-open . 0)
                (brace-list-open . 0)
                (c . c-lineup-C-comments)
                (case-label . 0)
                (catch-clause . 0)
                (class-open . 0)
                (comment-intro . c-lineup-comment)
                (composition-close . 0)
                (composition-open . 0)
                (cpp-define-intro c-lineup-cpp-define +)
                (cpp-macro . -1000)
                (cpp-macro-cont . +)
                (defun-open . 0)
                (do-while-closure . 0)
                (else-clause . 0)
                (extern-lang-open . 0)
                (friend . 0)
                (func-decl-cont . +)
                (incomposition . +)
                (inexpr-class . +)
                (inexpr-statement . +)
                (inher-cont . c-lineup-multi-inher)
                (inher-intro . +)
                (inlambda . c-lineup-inexpr-block)
                (inline-close . 0)
                (inline-open . +)
                (inmodule . +)
                (knr-argdecl . 0)
                (knr-argdecl-intro . 0)
                (label . 0)
                (lambda-intro-cont . +)
                (module-close . 0)
                (module-open . 0)
                (namespace-open . 0)
                (objc-method-args-cont . c-lineup-ObjC-method-args)
                (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
                (objc-method-intro .
                                   [0])
                (statement-case-intro . +)
                (statement-case-open . 0)
                (string . -1000)
                (substatement . +)
                (substatement-label . 0)
                (substatement-open . 0)
                (template-args-cont c-lineup-template-args +))))
(setq c-default-style "NETATMO") ;; set style to "linux"

;; guess from clang
;; (use-package clang-format
;;   :after (s)
;;   :init
;;   (defun get-clang-format-option (config-str field is-num)
;;     "Retrieve a config option from a clang-format config.

;; CONFIG-STR is a string containing the entire clang-format config.
;; FIELD is specific option, e.g. `IndentWidth'.  IS-NUM is a
;; boolean that should be set to 1 if the option is numeric,
;; otherwise assumed alphabetic."
;;     (if is-num
;;         (let ((primary-match (s-match (concat "^" field ":[ \t]*[0-9]+") config-str)))
;;           (if primary-match
;;               (string-to-number (car (s-match "[0-9]+" (car primary-match))))
;;             0))
;;       (let ((primary-match (s-match (concat "^" field ":[ \t]*[A-Za-z]+") config-str)))
;;         (if primary-match
;;             (car (s-match "[A-Za-z]+$" (car primary-match)))
;;           ""))))
;;   :hook (c-mode-common . (lambda ()
;;                            (let* ((clang-format-config
;;                                    (shell-command-to-string "clang-format -dump-config"))
;;                                   (c-offset (get-clang-format-option clang-format-config "IndentWidth" t))
;;                                   (tabs-str (get-clang-format-option clang-format-config "UseTab" nil))
;;                                   (base-style
;;                                    (get-clang-format-option clang-format-config "BasedOnStyle" nil)))
;;                              (progn
;;                                (if (> c-offset 0)
;;                                    (setq-local c-basic-offset c-offset)
;;                                  (if (not (equal "" base-style))
;;                                      (cond ((or (equal "LLVM" base-style)
;;                                                 (equal "Google" base-style)
;;                                                 (equal "Chromium" base-style)
;;                                                 (equal "Mozilla" base-style))
;;                                             (setq-local c-basic-offset 2))
;;                                            ((equal "WebKit" base-style)
;;                                             (setq-local c-basic-offset 4)))))
;;                                (if (not (equal "" tabs-str))
;;                                    (if (not (string-equal "Never" tabs-str))
;;                                        (setq-local indent-tabs-mode t)
;;                                      (setq-local indent-tabs-mode nil))
;;                                  (if (not (equal "" base-style))
;;                                      (cond ((or (equal "LLVM" base-style)
;;                                                 (equal "Google" base-style)
;;                                                 (equal "Chromium" base-style)
;;                                                 (equal "Mozilla" base-style)
;;                                                 (equal "WebKit" base-style))
;;                                             (setq-local indent-tabs-mode nil))))))))))


(provide 'setup-c)
