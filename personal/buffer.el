;;; package --- Buffer
;;; Commentary:
;;;  Functions that operate on the current buffer.

;;; Code:

;; Buffer cleanup functions
(defun untabify-buffer ()
  "Untabify the current buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Indent the current buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (when (eq major-mode 'clojure-mode)
    (indent-buffer)
    (untabify-buffer))
  (delete-trailing-whitespace))

;; Highlight special tags in files
(defun highlight-tags ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(provide 'buffer)
;;; buffer.el ends here
