(require 'xah-lookup)
(setq xah-lookup-browser-function 'eww)

(defun xah-lookup-cppreference (&optional word)
  "Lookup definition of current word or text selection in URL."
  (interactive)
  (xah-lookup-word-on-internet
   word
   ;; Use � as a placeholder in the query URL.
   "http://en.cppreference.com/mwiki/index.php?search=�"
   xah-lookup-browser-function))

(require 'cc-mode)

;; Add shortcut for c++-mode
(define-key c++-mode-map (kbd "C-c d") #'xah-lookup-cppreference)

;; Another example with http://www.boost.org
(defun xah-lookup-boost (&optional word)
  (interactive)
  (xah-lookup-word-on-internet
   word
   "https://cse.google.com/cse?cx=011577717147771266991:jigzgqluebe&q=�"
   xah-lookup-browser-function))

(define-key c++-mode-map (kbd "C-c b") #'xah-lookup-boost)
(define-key c++-mode-map (kbd "C-c f") #'xah-lookup-cppreference)


(provide 'setup-lookup)
