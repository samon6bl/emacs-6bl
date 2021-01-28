(setq locale-coding-system 'utf-8)

;; 设置主目录
(setq default-directory "~/Nextcloud/")
;; 自动替换所选
(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭生产的保存文件
(setq auto-save-default nil)
(setq make-backup-files nil)

;; 关闭欢迎界面和scratch清空
(setq inhibit-startup-message nil)
(setq initial-scratch-message "")

;; powin 配置
(require 'popwin)
(popwin-mode 1)

;; 补全括号
(electric-pair-mode 1)

;; 错误时警告声关闭
(setq ring-bell-function 'ignore)

;; yes-no缩短
(fset 'yes-or-no-p 'y-or-n-p)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/lisp"))

(defun open-agenda-file()
  (interactive)
  (find-file "~/Nextcloud/agenda"))

(global-set-key (kbd "<f5>") 'open-agenda-file)
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


(setenv "PKG_CONFIG_PATH" "/usr/local/lib/pkgconfig:/usr/local/Cellar/libffi/3.2.1/lib/pkgconfig")
(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/:/opt/anaconda/bin/")

(winner-mode +1)
(define-key winner-mode-map (kbd "<M-left>") #'winner-undo)
(define-key winner-mode-map (kbd "<M-right>") #'winner-redo)

(global-set-key "\C-cs" 'shell)

(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa
  :commands (esup))

;;设置切换窗口为a-z
(setq switch-window-shortcut-style 'qwerty)
(global-set-key (kbd "C-x o") 'switch-window)
;;projectilep配置
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;neotree配置
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

(use-package autoinsert
  :init
  ;; Don't want to be prompted before insertion:
  (setq auto-insert-query nil)

  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)

  :config
  (define-auto-insert "\\.org?$" "default-org.org"))

(setq url-using-proxy t)
(setq url-proxy-services '(("http" . "127.0.0.1:8889")))


(which-key-mode)
(setq which-key-popup-type 'minibuffer)

(global-undo-tree-mode)
(defadvice undo-tree-visualizer-mode (after undo-tree-face activate)
  (buffer-face-mode))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))



(provide 'init-better-defaults)
