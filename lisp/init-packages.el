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
			   powerline
			   ;; --- Themes ---
			   dracula-theme
			   solarized-theme
			   moe-theme
			   ;; --- Package ---
			   use-package
			   names
			   async
			   all-the-icons
			   all-the-icons-dired
			   ;; --- Org ---
			   org-roam
			   org-roam-bibtex
			   org-roam-server
                           define-word
			   deft
			   org-noter
			   let-alist
			   tablist
			   org-pdftools
			   org-noter-pdftools
			   org-superstar
			   elfeed-org
			   youdao-dictionary
			   helm
			   ox-pandoc
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
