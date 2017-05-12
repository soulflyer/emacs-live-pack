(require 'mu4e)
;;(require 'notmuch)
(setq
 mu4e-maildir "~/Mail"
 mu4e-sent-folder "/INBOX.sent"
 mu4e-trash-folder "/INBOX.trash"
 mu4e-confirm-quit nil
 mu4e-view-show-images t)
(add-to-list 'mu4e-headers-actions
              '("in browser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions
              '("in browser" . mu4e-action-view-in-browser) t)
;; (setq mu4e-html2text-command
;;       "textutil -stdin -format html -convert txt -stdout")
;;(mu4e-maildirs-extension)
(require 'notmuch)
