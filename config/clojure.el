;;; package --- Summary
;;; Commentary:
;;; Code:
(setq clojure-indent-style :always-indent)
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
  (context 2)
  (-> 1)
  (->> 1)
  (as-> 1)
  (some-> 1)
  (some->> 1))

(setq cider-repl-history-file "~/.cider-history")
(setq cider-prompt-for-symbol nil)
(setq cider-show-error-buffer nil)

;; This should probably be set per project in .dir-locals.el
(setq cider-default-cljs-repl 'figwheel )

;; Colourize all fns known to be defined, not just clojure core
(setq cider-font-lock-dynamically '(macro core function var deprecated))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-r")))

;;; clojure.el ends here
