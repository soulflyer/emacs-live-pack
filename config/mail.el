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

(add-to-list 'mu4e-header-info-custom
             '(:real-to .
                        (:name "Real :to Address"
                               :shortname "realto"
                               :help ":to address without any aliases"
                               :function (lambda (msg)
                                           (cdr (nth 0 (mu4e-message-field msg :to)))))))

(setq mu4e-headers-fields
      '((:human-date .  12)
        (:flags      .   6)
        (:from       .  22)
        (:subject    . 80)
        (:real-to    . nil)))

(setq mu4e-maildir-shortcuts
      `(("/INBOX.Archives.2017" . ?a)
        ("/INBOX"               . ?i)
        ("/INBOX.Junk"          . ?s)))

;; fix up the display of html messages in mu4e
(setq shr-color-visible-luminance-min 85)

(add-to-list 'mu4e-view-actions
              '("in browser" . mu4e-action-view-in-browser) t)

(defface email-public
  '((t :foreground "#bf9f00"))
  "Face for mail headers to public@soulflyer.co.uk"
  :group `basic-faces)
(defface email-teacher
  '((t :foreground "#9f009f"))
  "Face for mail headers to Teacher@soulflyer.co.uk"
  :group 'basic-faces)
(defface email-iain
  '((t :foreground "#009f00"))
  "Face for mail headers to iain@soulflyer.co.uk"
  :group 'basic-faces)
(defface email-photos
  '((t :foreground "#ef1010"))
  "Face for mail headers to photos@soulflyer.co.uk"
  :group 'basic-faces)
(defface email-wiserobot
  '((t :foreground "#0000e8"))
  "Face for mail headers to iain@wiserobot.com"
  :group 'basic-faces)


(setq email-public-face `email-public)
(setq email-teacher-face 'email-teacher)
(setq email-iain-face 'email-iain)
(setq email-photos-face 'email-photos)
(setq email-wiserobot-face 'email-wiserobot)

(setq header-highlights
      '((".*public@soulflyer.*" . email-public-face)
        (".*teacher@soulflyer.*" . email-teacher-face)
        (".*iain@soulflyer.*" . email-iain-face)
        (".*photos@soulflyer.*" . email-photos-face)
        (".*iain@wiserobot.com.*" . email-wiserobot-face)))

(add-hook 'mu4e-headers-mode-hook
          (lambda ()
            (print "hello again from mu4e-headers-mode")
            (setq font-lock-defaults '(header-highlights))))

(setq user-mail-address "iain@soulflyer.co.uk")
(require 'smtpmail)
;; (require 'starttls)
(setq smtpmail-smtp-service 465)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "mail.soulflyer.co.uk"
      smtpmail-smtp-user "iain+soulflyer.co.uk"
      smtpmail-stream-type `ssl)

(set-face-attribute 'mu4e-header-highlight-face nil
                    :underline nil
                    :bold nil
                    :background "#2f2f2f")
;; (set-face-attribute 'mu4e-replied-face nil :background "#000000" :foreground "#f00000")

;;; mail.el ends here
