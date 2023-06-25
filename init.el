(setq straight-use-package-by-default t)
(setq straight-recipes-gnu-elpa-use-mirror t)


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; we need to load the up to date org package to avoid conflicts
(straight-use-package 'org)
;; this needs to be setup before loading org
;; (setq org-replace-disputed-keys t)

(require 'org)
(org-babel-load-file
 (expand-file-name "emacs.org"
                   user-emacs-directory))
