;;; package --- Summary:
;;; Commentary:
(require 'mu4e)
;;(require 'notmuch)
;;; Code:
(setq
 mu4e-maildir "~/Mail"
 mu4e-sent-folder "/INBOX.sent"
 mu4e-trash-folder "/INBOX.trash"
 mu4e-confirm-quit nil
 mu4e-view-show-images t
 mu4e-use-fancy-chars nil)

(setq mu4e-headers-fields
      '((:to . 12 )
        (:human-date    .  12)
        (:flags         .   6)
        (:from          .  22)
        (:subject       .  nil)))

(add-to-list 'mu4e-headers-actions
              '("in browser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions
              '("in browser" . mu4e-action-view-in-browser) t)
;; (setq mu4e-html2text-command
;;       "textutil -stdin -format html -convert txt -stdout")
;;(mu4e-maildirs-extension)

(setq user-mail-address "iain@soulflyer.co.uk")
(require 'smtpmail)
;; (require 'starttls)
(setq smtpmail-smtp-service 465)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "mail.soulflyer.co.uk"
      smtpmail-smtp-user "iain+soulflyer.co.uk"
      smtpmail-stream-type `ssl)
;; (setq smtpmail-smtp-server "helo.nocdirect.com")
;; (setq smtpmail-debug-info t)
;; (setq smtpmail-debug-verb t)
;; (setq starttls-use-gnutls t)
;; (setq auth-source-debug `trivia)
(require 'notmuch)

;;; mail.el ends here
