;;; package --- Summary:
;;; Commentary:
(require 'mu4e)
(require 'notmuch)
;;; Code:
(setq
 mu4e-maildir "~/Mail"
 mu4e-sent-folder "/INBOX.Sent"
 mu4e-trash-folder "/INBOX.Trash"
 mu4e-confirm-quit nil
 mu4e-view-show-images t
 mu4e-use-fancy-chars nil
 mu4e-split-view nil)

(setq mu4e-headers-fields
      '((:to . 12 )
        (:human-date    .  12)
        (:flags         .   6)
        (:from          .  22)
        (:subject       .  nil)))

(setq mu4e-maildir-shortcuts
      `(("/INBOX.Archives.2017" . ?a)
        ("/INBOX"               . ?i)
        ("/INBOX.Junk"          . ?s)))

;; fix up the display of html messages in mu4e
(setq shr-color-visible-luminance-min 85)

;; (add-to-list 'mu4e-headers-actions
;;               '("in browser" . mu4e-action-view-in-browser) t)
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

;; (setq smtpmail-debug-info t)
;; (setq smtpmail-debug-verb t)
;; (setq starttls-use-gnutls t)
;; (setq auth-source-debug `trivia)

(set-face-attribute 'mu4e-header-highlight-face nil :underline nil :bold nil :background "#00005f")

;;; mail.el ends here
