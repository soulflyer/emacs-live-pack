(eval-after-load "org"
  '(progn
     ;; .txt files aren't in the list initially, but in case that changes
     ;; in a future version of org, use if to avoid errors
     (if (assoc "\\.jpg\\'" org-file-apps)
         (setcdr (assoc "\\.jpg\\'" org-file-apps) "default")
       (add-to-list 'org-file-apps '("\\.jpg\\'" . default) t))))

;;(add-to-list 'same-window-regexps "\*Org Agenda\*")
;; the line above doesn't work. Set org-agenda-window-setup instead
(setq org-agenda-window-setup 'current-window)

(setq org-agenda-files '("~/Documents/org-mode/plans"
                         "~/Documents/org-mode/notes"
                         "~/Code/Clojure/Descjop/hinh-anh/docs"))

(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks t)

(setq org-use-speed-commands t)
(setq org-lowest-priority 73)

(setq org-speed-commands-user nil)
(add-to-list 'org-speed-commands-user '("4" org-priority 68))
(add-to-list 'org-speed-commands-user '("5" org-priority 69))
(add-to-list 'org-speed-commands-user '("6" org-priority 70))
(add-to-list 'org-speed-commands-user '("7" org-priority 71))
(add-to-list 'org-speed-commands-user '("8" org-priority 72))
(add-to-list 'org-speed-commands-user '("9" org-priority 73))

(setq org-priority-faces (quote ((?A :foreground "#e00080")
                                 (?B :foreground "#e00000")
                                 (?C :foreground "#f04000")
                                 (?D :foreground "#c0c000")
                                 (?E :foreground "#00f000")
                                 (?F :foreground "#00c0e0")
                                 (?G :foreground "#0000f4")
                                 (?H :foreground "#8000d0")
                                 (?I :foreground "#575757"))))

(add-hook 'org-mode-hook (lambda ()

                           (set-face-attribute 'org-level-1 nil :foreground "#80ff00")
                           (set-face-attribute 'org-level-2 nil :foreground "#80ff40")
                           (set-face-attribute 'org-level-3 nil :foreground "#80ff80")
                           ;; org-level-4 was still showing too dim, so it is defined by customize.
                           (set-face-attribute 'org-level-4 nil :foreground "#40fff0")
                           (set-face-attribute 'org-level-5 nil :foreground "#20f0f0")
                           (set-face-attribute 'org-level-6 nil :foreground "#40d0f0")
                           (set-face-attribute 'org-level-7 nil :foreground "#40a0a0")
                           (set-face-attribute 'org-level-8 nil :foreground "#409090")))


(custom-set-faces '(org-agenda-dimmed-todo-face ((t (:foreground "#7f7f7f")))))

(setq org-log-done 'time)

(setq org-taxonomy-file "~/Documents/Plans/taxonomy.org")
(setq org-capture-templates
      '(("p" "Plan" entry (file "~/Documents/Plans/plan.org")
         "* TODO %?%i [/]")
        ("t" "Taxonomy")
        ("tf" "Fish" entry (file+headline org-taxonomy-file "Fish")
         "*** %?%i")
        ("tc" "Crustacea" entry (file+headline org-taxonomy-file "Crustacea")
         "*** %?%i")
        ("ta" "Anemones" entry (file+headline org-taxonomy-file "Anemones")
         "* %?%i")
        ("tm" "Molluscs" entry (file+headline org-taxonomy-file "Molluscs")
         "* %?%i")
        ("ts" "Starfish" entry (file+headline org-taxonomy-file "Starfish")
         "* %?%i")))

(setq org-archive-location "archive/%s_archive::")
;; found at http://orgmode.org/worg/org-hacks.html
;; Should preserve structure in the archive file
(defun my-org-inherited-no-file-tags ()
  (let ((tags (org-entry-get nil "ALLTAGS" 'selective))
        (ltags (org-entry-get nil "TAGS")))
    (mapc (lambda (tag)
            (setq tags
                  (replace-regexp-in-string (concat tag ":") "" tags)))
          (append org-file-tags (when ltags (split-string ltags ":" t))))
    (if (string= ":" tags) nil tags)))

(defadvice org-archive-subtree (around my-org-archive-subtree-low-level activate)
  (let ((tags (my-org-inherited-no-file-tags))
        (org-archive-location
         (if (save-excursion (org-back-to-heading)
                             (> (org-outline-level) 1))
             (concat (car (split-string org-archive-location "::"))
                     "::* "
                     (car (org-get-outline-path)))
           org-archive-location)))
    ad-do-it
    (with-current-buffer (find-file-noselect (org-extract-archive-file))
      (save-excursion
        (while (org-up-heading-safe))
        (org-set-tags-to tags)))))
