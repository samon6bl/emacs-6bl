(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode 1)

(load-theme 'monokai 1)

(provide 'init-ui)

;; 光标
(setq-default cursor-type 'bar)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)


