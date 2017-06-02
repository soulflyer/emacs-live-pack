;; Function to open and goto indented next line
(defun open-next-line()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;; Add file creation to dired
(defun dired-make-file (new-file-name)
  (interactive "sFile name: ")
  (shell-command (concat "touch " new-file-name))
  (message "created %s" new-file-name)
  (message "major mode %s" major-mode)
  (if (string= major-mode "dired-mode")
      (revert-buffer)))
