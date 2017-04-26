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

(setq org-agenda-files '("~/Documents/Plans"))

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

(setq org-priority-faces (quote ((?A :foreground "#d02030")
                                 (?B :foreground "#e00000")
                                 (?C :foreground "#f05000")
                                 (?D :foreground "#c0c000")
                                 (?E :foreground "#00f000")
                                 (?F :foreground "#00d090")
                                 (?G :foreground "#0000f4")
                                 (?H :foreground "#8000d0")
                                 (?I :foreground "#575757"))))

(add-hook 'org-mode-hook (lambda ()

(set-face-attribute 'org-level-1 nil :foreground "#00f000")
(set-face-attribute 'org-level-2 nil :foreground "#00d090")
(set-face-attribute 'org-level-3 nil :foreground "#40d0d0")
(set-face-attribute 'org-level-4 nil :foreground "#50a0a0")
(set-face-attribute 'org-level-5 nil :foreground "#508080")
(set-face-attribute 'org-level-6 nil :foreground "#606060")
(set-face-attribute 'org-level-7 nil :foreground "#505050")
(set-face-attribute 'org-level-8 nil :foreground "#404040")))


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
