(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Nextcloud/agenda"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)

;; 打开 org-indent mode
(setq org-startup-indented t)


(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)))
;; This is usually the default, but keep in mind it must be nil
(setq org-hide-leading-stars nil)
;; This line is necessary.
(setq org-superstar-leading-bullet ?\s)



(setq org-refile-targets (quote (("project.org" :maxlevel . 2) 
                                 ("area.org" :maxlevel . 2)
				 ("archived.org" :maxlevel . 2)
				 ("task.org" :maxlevel . 2)
				 ("journal.org" :maxlevel . 2)
				 ("inbox.org" :maxlevel . 2))))
;; Org-roam
(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/Nextcloud/roam notes/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))
	      (("C-c n t" . org-roam-dailies-today))
	      (("C-c n c" . org-roam-dailies-capture-today))))
(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 9091
      org-roam-server-export-inline-images t
      org-roam-server-authenticate nil
      org-roam-server-network-label-truncate t
      org-roam-server-network-label-truncate-length 60
      org-roam-server-network-label-wrap-length 20)
(org-roam-server-mode)
(server-start)
(require 'org-roam-protocol)
(setq org-roam-completion-system 'helm)
(add-to-list 'org-roam-capture-ref-templates
             '("a" "Annotation" plain (function org-roam-capture--get-point)
               "%U ${body}\n"
               :file-name "${slug}"
               :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n"
               :immediate-finish t
               :unnarrowed t))
(setq org-roam-dailies-directory "~/Nextcloud/roam notes/Daily/")

(use-package org-pretty-tags
  :demand t
  :config
  (setq org-pretty-tags-surrogate-strings
        (quote
         (("Note" . "✍")
          ("Task" . "")
	  ("Event" . "")
	  )))
  (org-pretty-tags-global-mode))

;;设置归档目录和headline
(setq org-archive-location "~/Nextcloud/agenda/archived.org::date-tree")
(with-eval-after-load 'org
  ;; ... bunch of other org configurations ...
 ;; Org-transclusion
  (define-key global-map (kbd "<f12>") #'org-transclusion-mode))

;; ... other configurations ...
(add-hook 'org-mode-hook (lambda () (load-file "~/.emacs.d/lisp/org-transclusion.el")))


(executable-find "sqlite3")
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-latex-compiler "xelatex")

(use-package org-noter
  :after org
  :ensure t)


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
(setq rmh-elfeed-org-files (list "~/Nextcloud/agenda/elfeed.org"))

(require 'elfeed-org)

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
(setq-default org-download-image-dir "~/Pictures/org/")
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("C-c D" . org-download-screenshot)
         ("C-c d" . org-download-clipboard))))

(global-set-key (kbd "C-c l") 'org-store-link)

(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'width-font-face)
    (set-face-attribute 'width-font-face nil :font "Sarasa Mono SC Nerd")
    (setq buffer-face-mode-face 'width-font-face)
    (buffer-face-mode))

(add-hook 'org-mode-hook 'org-buffer-face-mode-variable))

;;org latex包设置--中文显示
 (setq org-latex-packages-alist
      '(("fontset=macnew,UTF8" "ctex" t)))

;; default options for all output formats
(setq org-pandoc-options '((standalone . t)))
;; cancel above settings only for 'docx' format
(setq org-pandoc-options-for-docx '((standalone . nil)))
;; special settings for beamer-pdf and latex-pdf exporters
(setq org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex")))
(setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
;; special extensions for markdown_github output
(setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))


(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (ruby . t)
        (python . t)
        (latex . t)
        (plantuml . t)
        (R . t)))

(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(setq org-image-actual-width nil)

(defvar dynamic-agenda-files nil
  "dynamic generate agenda files list when changing org state")

(defun update-dynamic-agenda-hook ()
  (let ((done (or (not org-state) ;; nil when no TODO list
                  (member org-state org-done-keywords)))
        (file (buffer-file-name))
        (agenda (funcall (ad-get-orig-definition 'org-agenda-files)) ))
    (unless (member file agenda)
      (if done
          (save-excursion
            (goto-char (point-min))
            ;; Delete file from dynamic files when all TODO entry changed to DONE
            (unless (search-forward-regexp org-not-done-heading-regexp nil t)
              (customize-save-variable
               'dynamic-agenda-files
               (cl-delete-if (lambda (k) (string= k file))
                             dynamic-agenda-files))))
        ;; Add this file to dynamic agenda files
        (unless (member file dynamic-agenda-files)
          (customize-save-variable 'dynamic-agenda-files
                                   (add-to-list 'dynamic-agenda-files file)))))))

(defun dynamic-agenda-files-advice (orig-val)
  (union orig-val dynamic-agenda-files :test #'equal))

(advice-add 'org-agenda-files :filter-return #'dynamic-agenda-files-advice)
(add-to-list 'org-after-todo-state-change-hook 'update-dynamic-agenda-hook t)

