;;; package --- Summary
;;; Commentary:
;; Blackbored Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/themes/color-theme-blackbored.el")
;;
;; And then (color-theme-blackboard) to activate it.
;;
;; MIT License Copyright (c) 2008 JD Huntington <jdhuntington at gmail dot com>
;; Credits due to the excellent TextMate Blackboard theme
;;
;; All patches welcome

(require 'color-theme)

;;; Code:
;;;###autoload
(defun color-theme-blackbored ()
  "Color theme by Sam Aaron, based off BlackBoard by JD Huntington based off the TextMate Blackboard theme, created 2008-11-27."
  (interactive)
  (color-theme-install
   '(color-theme-blackbored
     ((background-color . "black")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#96CBFE")
      (foreground-color . "#EDEDED")
      (mouse-color . "sienna1"))

     (hl-line ((t (:background "#101010"))))
     (default ((t (:background "black" :foreground "#b2b2d0"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))

     (minibuffer-prompt ((t (:foreground "#61CE3C" :background "black"))))

     (show-paren-match ((((class color) (background dark)) (:background "#1c1c1c"))))
     ;;(show-paren-match ((t (:background "color-236"))))

     (font-lock-builtin-face ((t (:foreground "#4c83ff")))) ;; light blue
     (font-lock-comment-face ((t (:italic t :foreground "#aaa8a8"))))
     (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "magenta"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "gray57"))))
     (font-lock-reference-face ((t (:foreground "medium slate blue"))))
     (font-lock-reference-face ((t (:foreground "gray"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
     (font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-type-face ((t (:foreground "#E00000"))))
     (font-lock-variable-name-face ((t (:foreground "#FF6400"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (font-lock-doc-face ((t (:background "Black" :foreground "#61CE3C"))))

     (rainbow-delimiters-depth-1-face ((t (:foreground "dark red"))))
     (rainbow-delimiters-depth-2-face ((t (:foreground "dark green"))))
     (rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
     (rainbow-delimiters-depth-4-face ((t (:foreground "yellow"))))
     (rainbow-delimiters-depth-5-face ((t (:foreground "green"))))
     (rainbow-delimiters-depth-6-face ((t (:foreground "light blue"))))
     (rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
     (rainbow-delimiters-depth-8-face ((t (:foreground "slate blue"))))
     (rainbow-delimiters-depth-9-face ((t (:foreground "light gray"))))
     (rainbow-delimiters-unmatched-face ((t (:foreground "white"))))

     (gui-element ((t (:background "#333333" :foreground "#96CBFE"))))
     (region ((t (:background "#7F073F"))))

     (mode-line ((t (:background "gray10" :foreground "#4c83ff"))))
     (mode-line-inactive ((t (:background "gray10" :foreground "gray30"))))

     (highlight ((t (:background "#444444"))))
     (isearch ((t (:background "yellow" :foreground "black"))))
     (isearch-fail ((t (:background "red4"))))
     (lazy-highlight ((t (:background "#181818"))))
     (query-replace ((t (:background "#333333" ))))
     (Highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (vertical-border ((t (:background "black" :foreground "#333333"))))
     (zmacs-region ((t (:background "snow" :foreground "ble"))))

     (diff-added ((t (:foreground "green"))))
     (diff-removed ((t (:foreground "red"))))

     (next-error ((t (:background "black" :foreground "deep pink" :underline t))))

     (magit-diff-add ((t (:background "black" :foreground "green"))))
     (magit-diff-del ((t (:background "black" :foreground "red"))))
     (magit-diff-removed ((t (:background "black" :foreground "#a00000"))))
     (magit-diff-removed-highlight ((t (:background "black" :foreground "#ff0000"))))
     (magit-diff-added ((t (:background "black" :foreground "#00a000"))))
     (magit-diff-added-highlight ((t (:background "black" :foreground "#00ff00"))))
     (magit-item-highlight ((t (:background "gray15"))))
     (magit-section-title ((t (:foreground "deep pink"))))
     (magit-diff-hunk-heading ((t (:background "black" :foreground "#0000a0"))))
     (magit-diff-hunk-heading-highlight ((t (:background "black" :foreground "#0000ff"))))
     (magit-branch ((t (:foreground "gold"))))

     (eval-sexp-fu-flash ((t (:background "grey15" :foreground "DeepPink3"))))

     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
     (ac-candidate-face ((t (:background "gray60" :foreground "black"))))
     (ac-selection-face ((t (:background "deep pink" :foreground "black"))))
     (popup-isearch-match ((t (:background "black" :foreground "deep pink"))))
     (popup-tip-face ((t (:background "#333333" :foreground "white"))))
     (popup-scroll-bar-foreground-face ((t (:background "#0A0A0A"))))
     (popup-scroll-bar-background-face ((t (:background "#333333"))))

     (window-number-face ((t (:background "grey10" :foreground "#4c83ff"))))

     (yas/field-highlight-face ((t (:background "deep pink" :foreground "black"))))

     (git-gutter:modified ((t (:foreground "#4c83ff" :background "gray5"))) )
     (git-gutter:deleted ((t (:foreground "gray10" :background "gray5"))) )
     (git-gutter:added ((t (:foreground "#61CE3C" :background "gray5" ))) )
     (git-gutter:unchanged ((t (:background "grey5" ))) )

     (naeu-green-face ((t (:foreground "green" :background "black"))))
     (naeu-pink-face ((t (:foreground "deep pink" :background "black"))))
     (naeu-blue-face ((t (:foreground "medium slate blue" :background "black"))))
     (naeu-orange-face ((t (:foreground "#FBDE2D" :background "black"))))
     (naeu-red-face ((t (:foreground "orange" :background "black"))))
     (naeu-grey-face ((t (:foreground "gray30" :background "black")))))))

(custom-set-faces

 ;;nXhtml colours
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))))

 ;;ediff
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red")))))
