(powerline-default-theme)

(setq python-python-command "/opt/anaconda3/bin/python")

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
    ;; 补全列表左右对齐
    (setq company-tooltip-align-annotations t)
    ;; 虚拟环境
    (setq jedi:environment-root "jedi")))

;; enable python插件
(use-package elpy
  :ensure t
  :init
  (elpy-enable))




(setq python-shell-completion-native-enable nil)


(provide 'init-python)
