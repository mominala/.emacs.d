(require 'elfeed)
(require 'cl-lib)
(require 'eww)

(defvar arxiv-categories '("stat.ML"
                           "cs.CV"
                           "cs.AI"
                           "cs.LG"
                           "math.PR"
                           "stat.TH"))

(defvar arxiv-queries '("object+detection"
                        "similarity"
                        "metric+learning"
                        "domain+adaptation"
                        "distillation"
                        "tracking"
                        "pruning"
                        "transfer"
                        "self-supervised"
                        "representation"
                        "semi-supervised"
                        "few+shot"))

(defvar query-text "http://export.arxiv.org/api/query?search_query=%%28%s%%29+AND+abs:%%22%s%%22&sortBy=submittedDate&sortOrder=descending&max_results=%d")



(defvar num-results 30)



(defun re-seq (regexp string)
  "Get a list of all regexp matches in a string"
  (save-match-data
    (let ((pos 0)
          matches)
      (while (string-match regexp string pos)
        (push (match-string 0 string) matches)
        (setq pos (match-end 0)))
      matches)))

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))


(defun get-filtered-arxiv-feed (query)
  "construct query text to arxiv API"
  (cl-flet ((compose-with-or (arg1 arg2) (format "%s+OR+%s" arg1 arg2)))
    `(,(format query-text
            (cl-reduce #'compose-with-or (mapcar
                                          (lambda (arg) (format "cat:%s" arg))
                                          arxiv-categories))
            query
            num-results
            )
      arxiv
      ,(make-symbol (replace-in-string "+" "-" query)))))


(defun open-arxiv-pdf-link ()
  "open arxiv pdf with eww"
  (interactive)
  (let ((urlreg "http://arxiv.org/abs/.*"))
    (eww (format "%s.pdf"
                 (replace-in-string "/abs/"
                                    "/pdf/"
                                    (substring-no-properties
                                     (car (re-seq urlreg (buffer-string)))))))))


(global-set-key (kbd "C-x w") 'elfeed)
(define-key elfeed-show-mode-map (kbd "C-c C-c") 'open-arxiv-pdf-link)

(setq elfeed-feeds
      (append '(("https://francisbach.com/feed" ML blog stats)
                ("https://distill.pub/rss.xml" ML blog)
                ("http://arxiv.org/rss/cs.AI" ML arxiv AI)
                ("http://arxiv.org/rss/cs.LG" ML arxiv)
                ("http://arxiv.org/rss/cs.CV" ML arxiv vision)
                ("http://arxiv.org/rss/stat.ML" ML arxiv stat)
                ("http://arxiv.org/rss/math.ST" Math arxiv stat)
                ("https://www.reddit.com/r/MachineLearning/.rss" reddit ML)
                ("https://www.reddit.com/r/statistics/.rss" reddit stat))
              (mapcar #'get-filtered-arxiv-feed arxiv-queries)))

(provide 'setup-elfeed)
