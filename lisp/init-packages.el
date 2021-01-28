(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
			     ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
			     ("org"   . "http://mirrors.cloud.tencent.com/elpa/org/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
			   ;; --- Auto-completion ---
			   company
			   ;; --- Better Editor ---
			   smooth-scrolling
			   hungry-delete
			   smartparens
			   popwin
			   reveal-in-osx-finder
			   neotree
			   switch-window
                           ranger
			   projectile
			   super-save
			   ;; --- Major Mode ---
			   markdown-mode
			   exec-path-from-shell
			   ;; --- Python mode ---
			   elpy
			   company-jedi
			   flycheck
			   ;; --- Themes ---
			   dracula-theme
			   solarized-theme
			   moe-theme
			   helm-themes
			   doom-themes
			   ;; --- Package ---
			   use-package
			   names
			   async
			   all-the-icons
			   all-the-icons-dired
			   yasnippet
			   ;; --- Org ---
			   org-download
			   org-ref
			   org-roam
			   org-roam-bibtex
			   org-roam-server
			   org-super-agenda
			   helm-org-rifle
			   pocket-reader
			   deft
			   org-pdftools
			   pdf-tools
			   org-noter
			   auctex
			   let-alist
			   tablist
			   org-superstar
			   elfeed
			   elfeed-org
			   youdao-dictionary
			   helm
			   ox-pandoc
			   ox-hugo
			   esup
			   org-pretty-tags
			   which-key
			   undo-tree
			   anki-editor
			   nov
			   avy
			   centaur-tabs
			   )"Default packages")
;; ...

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))


 
;; 文件末尾
(provide 'init-packages)
