;;; package --- Summary
;;; Commentary:
;;; Code:

(defun open-next-line()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun dired-make-file (new-file-name)
  "Add file creation to dired NEW-FILE-NAME."
  (interactive "sFile name: ")
  (shell-command (concat "touch " new-file-name))
  (message "created %s" new-file-name)
  (message "major mode %s" major-mode)
  (if (string= major-mode "dired-mode")
      (revert-buffer)))

;;; functions.el ends here
