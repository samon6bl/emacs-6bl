(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org/agenda"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)

;; 打开 org-indent mode
(setq org-startup-indented t)


;; 设置 todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "HAND" "|" "DONE")))

;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
(setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
                                ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
                                ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))

;; agenda 里面时间块彩色显示
;; From: https://emacs-china.org/t/org-agenda/8679/3
(defun ljg/org-agenda-time-grid-spacing ()
  "Set different line spacing w.r.t. time duration."
  (save-excursion
    (let* ((background (alist-get 'background-mode (frame-parameters)))
           (background-dark-p (string= background "dark"))
           (colors (list "#1ABC9C" "#2ECC71" "#3498DB" "#9966ff"))
           pos
           duration)
      (nconc colors colors)
      (goto-char (point-min))
      (while (setq pos (next-single-property-change (point) 'duration))
        (goto-char pos)
        (when (and (not (equal pos (point-at-eol)))
                   (setq duration (org-get-at-bol 'duration)))
          (let ((line-height (if (< duration 30) 1.0 (+ 0.5 (/ duration 60))))
                (ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
            (overlay-put ov 'face `(:background ,(car colors)
                                                :foreground
                                                ,(if background-dark-p "black" "white")))
            (setq colors (cdr colors))
            (overlay-put ov 'line-height line-height)
            (overlay-put ov 'line-spacing (1- line-height))))))))

(add-hook 'org-agenda-finalize-hook #'ljg/org-agenda-time-grid-spacing)



;; org-capture 
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates nil)
(add-to-list 'org-capture-templates
             '("t" "To-do task" entry
               (file+headline "~/Org/task.org" "Tasks")
               "* TODO %^{Task}\n%u\n%?\n"))

(setq org-refile-targets (quote (("project.org" :maxlevel . 2)                                             
                                 ("area.org" :maxlevel . 2)
				 ("archived.org" :maxlevel . 2)
				 ("task.org" :maxlevel . 2))))

(setq org-roam-directory "~/Org/roam notes")
(add-hook 'after-init-hook 'org-roam-mode)
(executable-find "sqlite3")

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)


