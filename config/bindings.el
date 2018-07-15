;;; package --- Summary
;;; Commentary:
;; Place your bindings here.♯
;;; Code:
;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key direx:direx-mode-map (kbd "s") 'direx-grep:grep-item)
(define-key direx:direx-mode-map (kbd "S") 'direx-grep:grep-item-from-root)
(define-key direx:direx-mode-map (kbd "a") 'direx-grep:show-all-item-at-point)
(define-key direx:direx-mode-map (kbd "A") 'direx-grep:show-all-item)

(global-set-key (kbd "C-c C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m o") 'mc/mark-pop)
(global-set-key (kbd "C-c m m") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c m d") 'mc/mark-all-dwim)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-a")     'back-to-indentation)
(global-set-key (kbd "C-x C-a") 'move-beginning-of-line)
(global-set-key (kbd "C-c -") 'v-resize)
(global-set-key (kbd "M-<left>") 'paredit-backward-slurp-sexp)
(global-set-key (kbd "M-<right>") 'paredit-backward-barf-sexp)
(global-set-key (kbd "C-o") 'avy-goto-char-timer)
(global-set-key (kbd "C-c C-M-h") 'helm-descbinds)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-M-\\") 'aggressive-indent-mode)
(global-set-key [f6] 'rgrep)
(global-set-key (kbd "C-c j d") 'dumb-jump-go)
(global-set-key (kbd "C-c j u") 'dumb-jump-back)
(global-set-key (kbd "C-c j g") 'dumb-jump-go-prompt)

;; This is for gui emacs. It shouldn't even reach command line emacs
(global-set-key (kbd "C-<tab>") 'win-switch-dispatch)

;; Should probably undo this in the emacs live paredit pack rather than rebind it back
;; to the default here.
(define-key paredit-mode-map (kbd "C-M-f") 'paredit-forward)

(define-prefix-command 'paredit-map)
(global-set-key (kbd "C-c p") 'paredit-map)
(define-key paredit-map (kbd "b f") 'paredit-forward-barf-sexp)
(define-key paredit-map (kbd "f b") 'paredit-forward-barf-sexp)
(define-key paredit-map (kbd "b b") 'paredit-backward-barf-sexp)
(define-key paredit-map (kbd "s f") 'paredit-forward-slurp-sexp)
(define-key paredit-map (kbd "f s") 'paredit-forward-slurp-sexp)
(define-key paredit-map (kbd "s b") 'paredit-backward-slurp-sexp)
(define-key paredit-map (kbd "b s") 'paredit-backward-slurp-sexp)

;; Release this so it can be used by yasnippet
(define-key org-mode-map (kbd "C-c C-s") nil)
(define-key org-mode-map (kbd "C-c C-n") nil)
(global-set-key (kbd "C-c C-s") 'yas-insert-snippet)
;;(global-set-key (kbd "C-c C-n") 'yas-new-snippet)

;; This line may make all the other RET redefines unnecessary....
(define-key prog-mode-map (kbd "RET") 'reindent-then-newline-and-indent)

(define-key dired-mode-map (kbd "f") 'dired-make-file)
(define-key dired-mode-map  (kbd "C-c C-e") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "/") 'dired-up-directory)
(define-key dired-mode-map [mouse-2] 'dired-find-file)
;; the following works mostly, but closes emacsclient if you step
;; back beyond the buffer where dired was first opened
;; (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
;; (define-key dired-mode-map [mouse-2] 'dired-single-buffer-mouse)
;; (define-key dired-mode-map (kbd "/")
;;   (function
;;    (lambda nil (interactive) (dired-single-buffer ".."))))

;;(define-key cider-repl-mode-map (kbd "<up>") 'cider-repl-backward-input)
;;(define-key cider-repl-mode-map (kbd "<down>") 'cider-repl-next-input)

(define-key cider-repl-mode-map (kbd "C-c C-c") 'cider-repl-kill-input)
(define-key cider-repl-mode-map (kbd "C-c h") 'cider-browse-ns-all)

(define-key js2-mode-map   (kbd "RET") 'reindent-then-newline-and-indent)
(define-key ruby-mode-map  (kbd "RET") 'reindent-then-newline-and-indent)
;;(define-key scss-mode-map  (kbd "RET") 'reindent-then-newline-and-indent)

;;(define-key org-mode-map (kbd "C-c C-c") 'org-capture-finalize)
(define-key org-mode-map (kbd "C-c C-k") 'org-capture-kill)
(add-hook 'css-mode-hook 'my-css-mods)
(defun my-css-mods ()
  ;;
  (define-key css-mode-map (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'sgml-mode-hook 'my-sgml-mods)
(defun my-sgml-mods ()
  "Add to sgml mode."
  (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)
  (define-key sgml-mode-map (kbd "C-c z") 'zencoding-expand-line)
  (define-key sgml-mode-map (kbd "RET") 'reindent-then-newline-and-indent))

(defvar diw-minor-mode-map (make-keymap) "D diw-minor-mode keymap.")
(define-key diw-minor-mode-map  (kbd "M-RET")   'open-next-line)
(define-key diw-minor-mode-map  (kbd "M-DEL")   'kill-whole-line)
(define-key diw-minor-mode-map  (kbd "C-o")     'avy-goto-char-timer)
(define-key diw-minor-mode-map  (kbd "C-x k")   'kill-this-buffer)
;; these are super key bindings. Not currently useful on mac
(define-key diw-minor-mode-map  (kbd "s-w")     'delete-frame)
(define-key diw-minor-mode-map  (kbd "s-o")     'ido-find-file)
(define-key diw-minor-mode-map  (kbd "C-x SPC") 'cua-set-mark)
(define-key diw-minor-mode-map  (kbd "C-x C-d") 'ido-dired)
(define-key diw-minor-mode-map  (kbd "C-x d")   'ido-dired)
(define-key diw-minor-mode-map  (kbd "C-x C-b") 'ibuffer)
(define-key diw-minor-mode-map  (kbd "C-x b")   'ido-switch-buffer)
(define-key diw-minor-mode-map  (kbd "C-x C-r") 'recentf-open-files)
(define-key diw-minor-mode-map  (kbd "C-x w")   'delete-window)
(define-key diw-minor-mode-map  (kbd "C-c C-v") 'visual-line-mode)
(define-key diw-minor-mode-map  (kbd "C-c C-t") 'toggle-truncate-lines)
(define-key diw-minor-mode-map  (kbd "C-x C-n") 'switch-to-next-buffer)
(define-key diw-minor-mode-map  (kbd "C-x C-p") 'switch-to-prev-buffer)
(define-key diw-minor-mode-map  (kbd "C-z")     'cua-scroll-down)
(define-key diw-minor-mode-map  (kbd "M-~")     'switch-to-next-buffer)
(define-key diw-minor-mode-map  (kbd "M-`")     'switch-to-prev-buffer)
(define-key diw-minor-mode-map  (kbd "M-m")     'iy-go-to-char)
(define-key diw-minor-mode-map  (kbd "M-M")     'iy-go-to-char-backward)
(define-key diw-minor-mode-map  (kbd "C-@")     'er/expand-region)
(define-key diw-minor-mode-map  (kbd "M-2")     'er/contract-region)
(define-key diw-minor-mode-map  (kbd "C-c o")   'org-agenda)
(define-key diw-minor-mode-map  (kbd "C-h")     'help)
(define-key diw-minor-mode-map  (kbd "C-c C-j") 'cider-jack-in)
(define-key diw-minor-mode-map  (kbd "C-c M-j") 'cider-jack-in-clojurescript)
(define-key diw-minor-mode-map  (kbd "C-c q")   'cider-quit)

(define-minor-mode diw-minor-mode
  "A minor mode so that my key settings aren't shadowed by other major/minor modes"
  t " diw" 'diw-minor-mode-map)
(provide 'bindings)
;;; bindings.el ends here
