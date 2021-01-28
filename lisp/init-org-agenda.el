(provide 'init-org-agenda)

;; 设置 todo keywords
(setq org-todo-keywords
      '((sequence "WAITING(w)" "TODAY(n)" "TODO(t)" "INPROGRESS(i)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
(setf org-todo-keyword-faces '(("WAITING" . (:foreground "#95A5A6" :weight bold))
                                ("TODAY" . (:foreground "Pink" :weight bold))
                                ("DONE" . (:foreground "#3498DB" :weight bold))
				("TODO" . (:foreground "#27AE60" :weight bold))
				("INPROGRESS" . (:foreground "Goldenrod" :weight bold))))

;; org-capture 
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates nil)
(setq org-capture-templates
             '(("t" "Task")
	       ("tt" "Today task" entry 
               (file+headline "~/Nextcloud/agenda/Task.org" "Task List") 
               "* TODAY %^{Task}\n%?\n")
	       ("td" "Todo task" entry 
               (file+headline "~/Nextcloud/agenda/Task.org" "Task List") 
                "* TODO %^{Task}\n%?\n")
	       ("tp" "tips" entry
	       (file+headline "~/Nextcloud/agenda/Tips.org" "Tips")
	       "* %? %^G\nEnered on %T\n")
	       ("r" "RSS" entry
		(file+headline "~/Nextcloud/agenda/elfeed.org" "RSS")
		"* %? %^g\n")
	       ("i" "Idea" entry
	       (file+headline "~/Nextcloud/agenda/Idea.org" "Idea")
	        "* %^{Idea}\nEnered on%T\n%?\n")
	       ("w" "Web site" entry
               (file+headline "~/Nextcloud/roam notes/20201219222415-material.org" "Material")
               "* %a :website:\n\n%U %?\n\n%:initial")))

(setq org-roam-dailies-capture-templates
      '(("n" "notes" entry
         #'org-roam-capture--get-point
         "* %?   :note:"
         :file-name "~/Nextcloud/roam notes/Daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n"
	 :olp ("note"))
        ("e" "events" entry
         #'org-roam-capture--get-point
         "* %? :event:"
         :file-name "~/Nextcloud/roam notes/Daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n"
         :olp ("Events"))
	("t" "task" entry
	 #'org-roam-capture--get-point
	 "* %? :task:"
	 :file-name "~/Nextcloud/roam notes/Daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n"
         :olp ("Task"))
	 ("h" "Tickler" entry
	   "* %?"
          #'org-roam-capture--get-point
	  :file-name "~/Nextcloud/roam notes/Daily/%<%Y-%m-%d>"
          :head "#+title: %<%Y-%m-%d>\n"
          :olp ("Task"))
	 ("d" "diary" entry
	  #'org-roam-capture--get-point
	  "* %?"
	  :file-name "~/Nextcloud/roam notes/Daily/%<%Y-%m-%d>"
          :head "#+title: %<%Y-%m-%d>\n"
          :olp ("Diary"))))




(setq org-super-agenda-groups
      '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
               :time-grid t  ; Items that appear on the time grid
               :todo "TODAY"
	       :transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "RosyBrown1"))))  ; Items that have this TODO keyword
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A"
		:transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "orange"))))
	 (:name "Habit"
		:tag "habit"
	        :transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "black"))))
         ;; Set order of multiple groups at once
	 (:name "Reading"
		:tag "Reading")
         (:order-multi (2 (:name "Food-related"
                                 ;; Multiple args given in list with implicit OR
                                 :tag ("food" "dinner")
				 		:transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "green"))))
                          (:name "Personal"
                                 :habit t
                                 :tag "personal"
				 		:transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "blue"))))))
         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9
	        :transformer (--> it
                              (upcase it)
                              (propertize it 'face '(:foreground "purple"))))
         (:priority<= "B"
		      :name "Routine"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 0
		      :transformer (--> it
                      (upcase it)
                      (propertize it 'face '(:foreground "brown"))))
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))

