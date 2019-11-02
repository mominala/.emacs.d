(require 'merlin)
(require 'tuareg)
(require 'proof-general)


(setq tuareg-indent-align-with-first-arg t)
(setq tuareg-match-patterns-aligned t)
(add-hook 'tuareg-mode-hook
          (lambda()
            (when (functionp 'prettify-symbols-mode)
              (prettify-symbols-mode))))


;; Register Merlin
(autoload 'merlin-mode "merlin" nil t nil)
;; Automatically start it in OCaml buffers
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook
          (lambda()
            (when (functionp 'prettify-symbols-mode)
              (prettify-symbols-mode))))

(custom-set-variables
 '(coq-prog-name (expand-file-name "~/.opam/4.08.1/bin/coqtop"))
 '(proof-three-window-enable t))


(provide 'setup-ocaml)
