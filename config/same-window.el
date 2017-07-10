;;; package --- Summary
;;; Commentary:
;;; Code:
(message "loading same-window.el")
;;(setq same-window-regexps '("."))
;;(setq same-window-regexps nil)
;;(add-to-list 'same-window-regexps ".")

(defun no-split-window ()
  "Documentation."
  (interactive)
  nil)

;; Don't do this or undo-tree becomes useless
;;(setq split-window-preferred-function 'no-split-window)
(setq split-window-preferred-function 'split-window-sensibly)

(setq ns-pop-up-frames nil)
(setq ns-pop-up-windows nil)
(add-to-list 'same-window-regexps "\*Help\*")
(add-to-list 'same-window-buffer-names "*Help*")
(add-to-list 'same-window-regexps "\*rake\*")
(add-to-list 'same-window-regexps "\*Apropos\*")
(add-to-list 'same-window-regexps "\*compilation\*")
(add-to-list 'same-window-regexps "\*ruby\*")
(add-to-list 'same-window-regexps "\*rails\*")
(add-to-list 'same-window-regexps "\*Shell Command Output\*")
(add-to-list 'same-window-regexps "\*grep\*")
(add-to-list 'same-window-regexps "*.erb")
(add-to-list 'same-window-regexps "\*Backtrace\*")
(add-to-list 'same-window-regexps "\*nrepl\*")
(add-to-list 'same-window-regexps "\*Colors\*")
(add-to-list 'same-window-regexps "\*Org Agenda\*")
(add-to-list 'same-window-regexps "\*magit\*")
(add-to-list 'same-window-regexps "\*cider-repl\*")
(add-to-list 'same-window-regexps "\*cider-doc\*")
(add-to-list 'same-window-regexps "\*cider-result\*")
(add-to-list 'same-window-regexps "\*YASnippet tables\*")
(add-to-list 'same-window-regexps "\*cider-doc\*")
(add-to-list 'same-window-regexps "\*cider-error\*")
(add-to-list 'same-window-regexps "\*cider-connections\*")
(add-to-list 'same-window-regexps "\*cider-classpath\*")
(add-to-list 'same-window-regexps "\*cider-ns-browser\*")
;;(add-to-list 'org-file-apps '("\\.jpg\\'" . default) t)
;;; same-window.el ends here
