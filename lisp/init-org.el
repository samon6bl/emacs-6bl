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
      '((sequence "TODO(t)" "DOING(i!)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
(setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
                                ("DOING" . (:foreground "white" :background "#2E8B57"  :weight bold))
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


(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)))
;; This is usually the default, but keep in mind it must be nil
(setq org-hide-leading-stars nil)
;; This line is necessary.
(setq org-superstar-leading-bullet ?\s)

;; org-capture 
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates nil)
(setq org-capture-templates
            '(("t" "To-do task" entry
               (file+headline "~/Org/agenda/task.org" "Task List")
               "* TODO %^{Task}\n%u\n%?\n")
	      ("j" "Journal" entry
	       (file+datetree "~/Org/agenda/journal.org")
              "* %?\nEntered on %U\n%i\n")))

(setq org-refbile-targets (quote (("project.org" :maxlevel . 2)                                             
                                 ("area.org" :maxlevel . 2)
				 ("archived.org" :maxlevel . 2)
				 ("task.org" :maxlevel . 2)
				 ("journal.org" :maxlevel . 2))))

(setq org-roam-directory "~/Org/roam notes")
(add-hook 'after-init-hook 'org-roam-mode)
(executable-find "sqlite3")
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-latex-compiler "xelatex")

;;设置归档目录和headline
(setq org-archive-location "~/Org/agenda/archived.org::* Archived")

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package org-noter
  :after org
  :ensure t)

(use-package pdf-tools
   :pin manual
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))


(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; 支持中文加粗
(setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(org-element-update-syntax)

(setq org-emphasis-alist
      (cons '("+" '(:strike-through t :foreground "gray"))
            (delete* "+" org-emphasis-alist :key 'car :test 'equal)))
(setq org-emphasis-alist
      (cons '("*" '(:emphasis t :foreground "pink"))
            (delete* "*" org-emphasis-alist :key 'car :test 'equal)))
(setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))

(require 'elfeed-org)
(setq elfeed-feeds
      '("https://iseex.github.io/feed.xml"
	"https://www.douban.com/feed/review/movie"))
(global-set-key (kbd "C-x w") 'elfeed)
(elfeed-org)

(setq org-html-inline-image-rules
      '(
        ;; Travis CI 图片 URL 的尾巴有些特殊
        ("file" . "\\.svg\\?branch=master\\'")
        ;; 原有的值
        ("file" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")
        ("http" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")
        ("https" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")))
(auto-image-file-mode t) 


;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)


;; emacs字体设置
(let ((emacs-font-size 14)
      (emacs-font-name "Sarasa Gothic SC"))
  (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
  (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:foreground "#6c71c4" :family "Sarasa Mono SC")))))

(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'width-font-face)
    (set-face-attribute 'width-font-face nil :font "Sarasa Gothic SC")
    (setq buffer-face-mode-face 'width-font-face)
    (buffer-face-mode))

(add-hook 'org-mode-hook 'org-buffer-face-mode-variable))

;;org latex包设置--中文显示
 (setq org-latex-packages-alist
      '(("fontset=macnew,UTF8" "ctex" t)))
