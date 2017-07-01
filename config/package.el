;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

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
;;(package-install 'clj-refactor)

;;; package.el ends here
