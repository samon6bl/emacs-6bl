(setq locale-coding-system 'utf-8)

;; 设置主目录
(setq default-directory "~/Org/roam notes")
;; 自动替换所选
(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭生产的保存文件
(setq auto-save-default nil)
(setq make-backup-files nil)

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
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(setenv "PKG_CONFIG_PATH" "/usr/local/lib/pkgconfig:/usr/local/Cellar/libffi/3.2.1/lib/pkgconfig")
(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/")

(provide 'init-better-defaults)
