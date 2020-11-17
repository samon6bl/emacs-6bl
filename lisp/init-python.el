(powerline-default-theme)
(use-package company-jedi
  :ensure t
  :init
  ;; 对company-jedi的一些初始化设置
  (progn
    ;; 按下字符就弹出补全，0延迟
    (setq jedi:get-in-function-call-delay 0)
    ;; 进入pyhton-mode的时候初始化jedi
    (add-hook 'python-mode-hook 'jedi:setup)
    ;; 在打出点的时候弹出补全
    (setq jedi:complete-on-dot t)
    ;; 补全的时候识别简写
    (setq jedi:use-shortcuts t)
    ;; 补全列表循环
    (setq company-selection-wrap-around t)
    ;; 虚拟环境
    (setq jedi:environment-root "jedi")))

;; enable python插件
(elpy-enable)



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

(provide 'init-python)
