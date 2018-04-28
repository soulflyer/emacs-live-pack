;;; package --- summary:
;;; Commentary:
;;; Code:
(setq-default flycheck-emacs-lisp-load-path 'inherit)
(require 'iy-go-to-char)
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/mu4e")

;; Don't do this, it breaks things. Keybind it instead.
(global-aggressive-indent-mode 1)
;; Ok do it, but don't let it screw up the dider-repl
(add-to-list 'aggressive-indent-excluded-modes 'cider-repl-mode)

(add-hook 'dired-mode-hook (lambda () (setq truncate-lines t)))
;; this sets the character displayed when a line is truncated.
;; use ?\  to remove it altogether.
(set-display-table-slot standard-display-table 0 ?~)

;; This should probably be set per project in .dir-locals.el
(setq cider-default-cljs-repl "Figwheel")

;; deal with big files
(package-install 'vlf)
(require 'vlf-setup)
(package-install 'inf-mongo)
(require 'inf-mongo)
(setq inf-mongo-command "/opt/local/bin/mongo 127.0.0.1:27017/soulflyer")

(package-install 'counsel-osx-app)
(require 'counsel-osx-app)

(package-install 'decide)
(require 'decide)

;;(package-install 'dired-single)
;;(require 'dired-single)

(package-install 'exiftool)
(require 'exiftool)

;; (load-file "/usr/local/gnugo-3.8/interface/gnugo.el")
;; (load-file "/usr/local/gnugo-3.8/interface/gnugo-big-xpms.el")
;; (load-file "/usr/local/gnugo-3.8/interface/make-xpms-file.el")
;; (setq gnugo-xpms nil)

;; (autoload 'gnugo "gnugo" "GNU GO" t)
;; (autoload 'gnugo-xpms "gnugo-big-xpms" "GNU GO" t)

(package-install 'google-translate)
(require 'google-translate)


(setq tramp-default-method "sshx")
(electric-pair-mode 1)

(ivy-mode 1)
(setq ivy-count-format "%d/%d:")
(setq ivy-use-virtual-buffers t)

(which-key-mode)
;; shut up about my elisp code you pedant
(setq-default flycheck-disabled-checkers `(emacs-lisp-checkdoc))

;;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;(setq-default  cursor-type 'bar)
(setq show-paren-style (quote expression))
(delete-selection-mode 1)

(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.\\(png\\|jp?g\\|pdf\\)\\'" "open" (file))
                              ("\\.\\(mp3\\|avi\\|wmv\\)\\'" "vlc" (file))))


(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'ruby-mode-hook 'paredit-mode)
(add-hook 'web-mode-hook 'zencoding-mode)

;; Enable paredit for a couple for non lisp modes; tweak
;; paredit-space-for-delimiter-predicates to avoid inserting spaces
;; before open parens.
(dolist (mode '(ruby espresso))
  (add-hook (intern (format "%s-mode-hook" mode))
            '(lambda ()
               (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
                            (lambda (_ _) nil))
               (enable-paredit-mode))))

(require 'scss-mode)
(require 'sws-mode)
(require 'jade-mode)
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Open .rake files in ruby mode
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))

;;stop emacs from shitting all over my file system
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq backup-inhibited t);

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)

;; (require 'json-mode)

(autoload 'applescript-mode "applescript-mode" "Major mode for editing AppleScript source." t)
(add-to-list 'auto-mode-alist '("\\.applescript$" . applescript-mode))

(autoload 'apples-mode "apples-mode" "Happy AppleScripting!" t)
(autoload 'apples-open-scratch "apples-mode" "Open scratch buffer for AppleScript." t)
(add-to-list 'auto-mode-alist '("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode))

;; This will cause "Zoning.." problem if flycheck is not installed (package-install)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Cleanup dired display
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-verbosity '(uid))

(setq default-tab-width 2)
(setq cider-repl-history-file "~/.cider-history")
(setq cider-prompt-for-symbol nil)
(setq cider-show-error-buffer nil)
(setq clojure-indent-style :align-arguments)
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
;; Colourize all fns known to be defined, not just clojure core
;; might want to add deprecated to the list?
;;(setq cider-font-lock-dynamically '(macro core function var))

;; Cleanup ibuffer display so I can tell which file is which
(setq ibuffer-formats '((mark modified read-only git-status-mini " "
                              (size 5 -1 :left :elide)
                              (name))
                        (mark filename)))

;; Highlight the cursor on focus. Can make it hard to read the current line.
;;(beacon-mode 1)

(autoload 'muttrc-mode "muttrc-mode.el" "Major mode to edit muttrc files" t)
(setq auto-mode-alist (append '(("muttrc\\'" . muttrc-mode)) auto-mode-alist))

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (OPTIONS 2)
  (PATCH 2)
  (rfn 2)
  (let-routes 1)
  (context 2))

;;; core.el ends here
