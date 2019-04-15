;;; package --- Summary:
;;; Commentary:

;;; Code:
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(setq
 mail-user-agent 'mu4e-user-agent
 mu4e-maildir "~/Mail"
 mu4e-sent-folder "/INBOX.Sent"
 mu4e-trash-folder "/INBOX.Trash"
 mu4e-confirm-quit nil
 mu4e-view-show-images t
 mu4e-use-fancy-chars nil
 mu4e-split-view nil
 mu4e-headers-sort-direction "descending"
 ;;mu4e-get-mail-command "offlineimap"

 message-kill-buffer-on-exit t)

(mu4e-maildirs-extension)
;;(setq mu4e-maildirs-extension-hide-empty-maildirs nil)
;;(setq mu4e-maildirs-extension-ignored-regex "INBOX.Archive")
(add-to-list 'mu4e-header-info-custom
             '(:real-to .
                        (:name "Real :to Address"
                               :shortname "realto"
                               :help ":to address without any aliases"
                               :function (lambda (msg)
                                           (cdr (nth 0 (mu4e-message-field msg :to)))))))

(define-key mu4e-headers-mode-map (kbd "SPC") 'mu4e-headers-view-message)

(setq mu4e-headers-fields
      '((:human-date .  12)
        (:flags      .   6)
        (:from       .  22)
        (:subject    . 80)
        (:real-to    . nil)))

(setq mu4e-maildir-shortcuts
      `(("/INBOX.Archives.2018" . ?a)
        ("/INBOX"               . ?i)
        ("/INBOX.spam"          . ?s)))

;; fix up the display of html messages in mu4e
(setq shr-color-visible-luminance-min 85)

(add-to-list 'mu4e-view-actions
              '("in browser" . mu4e-action-view-in-browser) t)

(defface email-public
  '((t :foreground "#bf9f00"))
  "Face for mail headers to public@soulflyer.co.uk"
  :group `basic-faces)
(defface email-teacher
  '((t :foreground "#cf009f"))
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
  '((t :foreground "#8070a8"))
  "Face for mail headers to iain@wiserobot.com"
  :group 'basic-faces)
(defface email-code
  '((t :foreground "#0000e8"))
  "Face for mail headers to code@soulflyer.co.uk"
  :group 'basic-faces)
(defface email-hotmail
  '((t :foreground "#a840f8"))
  "Face for mail headers to D_I_Wood@hotmail.com"
  :group 'basic-faces)
(defface email-me
  '((t :foreground "#20e0e0"))
  "Face for mail headers to soulflyer@me.com"
  :group 'basic-faces)
(defface email-google
  '((t :foreground "#e88800"))
  "Face for mail headers to google mail"
  :group 'basic-faces)


(setq email-public-face `email-public
      email-teacher-face 'email-teacher
      email-iain-face 'email-iain
      email-photos-face 'email-photos
      email-wiserobot-face 'email-wiserobot
      email-code-face 'email-code
      email-hotmail-face 'email-hotmail
      email-me-face 'email-me
      email-google-face 'email-google)

(setq header-highlights
      '((".*public@soulflyer.*" . email-public-face)
        (".*teacher@soulflyer.*" . email-teacher-face)
        (".*iain@soulflyer.*" . email-iain-face)
        (".*photos@soulflyer.*" . email-photos-face)
        (".*@wiserobot.com.*" . email-wiserobot-face)
        (".*\\(code@soulflyer.co.uk\\|github.com\\|flexiana.com\\).*" . email-code-face)
        (".*@hotmail.com.*" . email-hotmail-face)
        (".*\\(soulflyer@me.com\\|soulflyer@icloud.com\\).*" . email-me-face)
        (".*shysubversion@gmail.com.*" . email-google-face)))

(add-hook 'mu4e-headers-mode-hook
          (lambda ()
            (setq font-lock-defaults '(header-highlights))))

;; when you reply to a message, use the identity that the mail was sent to
;; -- function that checks to, cc and bcc fields
;; Found at https://vxlabs.com/2014/06/06/configuring-emacs-mu4e-with-nullmailer-offlineimap-and-multiple-identities/
(defun cpb-mu4e-is-message-to (msg rx)
  "Check if to, cc or bcc field in MSG has any address in RX."
  (or (mu4e-message-contact-field-matches msg :to rx)
      (mu4e-message-contact-field-matches msg :cc rx)
      (mu4e-message-contact-field-matches msg :bcc rx)))

;; we only do something if we recognize something (i.e. no stupid default)
(add-hook 'mu4e-compose-pre-hook
          (defun my-set-from-address ()
            "Set current identity based on to, cc, bcc of original."
            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
              (if msg
                  (setq user-mail-address
                        (cond
                         ((cpb-mu4e-is-message-to msg (list "iain@soulflyer.co.uk"
                                                            "iain@soulflyer.com"
                                                            "D_I_Wood@hotmail.com"))
                          "iain@soulflyer.co.uk")
                         ((cpb-mu4e-is-message-to msg (list "public@soulflyer.co.uk"
                                                            "@googlegroups.com"))
                          "public@soulflyer.co.uk")
                         ((cpb-mu4e-is-message-to msg "teacher@soulflyer.co.uk")
                          "teacher@soulflyer.co.uk")
                         ((cpb-mu4e-is-message-to msg (list "photos@soulflyer.co.uk"
                                                            "photo-request@soulflyer.co.uk"))
                          "photos@soulflyer.co.uk")
                         (t "iain@soulflyer.co.uk")))))))

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
