;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
;;(setq package-pinned-packages nil)
(package-initialize)

(package-install 'flycheck)
(package-install 'php-mode)
(package-install 'php+-mode)
(package-install 'apples-mode)
(package-install 'applescript-mode)
(package-install 'beacon)
(package-install 'sws-mode)
(package-install 'jade-mode)
(package-install 'feature-mode)
(package-install 'google-translate)
(package-install 'inf-mongo)
(setq inf-mongo-command "/opt/local/bin/mongo 127.0.0.1:27017/soulflyer")
(package-install 'paradox)
(setq paradox-github-token "464596cc31f802408d766a6b47a6052b61a5919c")

;; deal with big files
(package-install 'vlf)
(require 'vlf-setup)

(package-install 'counsel-osx-app)
(require 'counsel-osx-app)

(package-install 'decide)
;; without the require, the decide-roll functions don't appear until after
;; decide-maode is called?
(require 'decide)

;;This could be useful, but it has no interactive fns so only good for elisp programming.
;;(package-install 'exiftool)
;;(require 'exiftool)





;;; package.el ends here
