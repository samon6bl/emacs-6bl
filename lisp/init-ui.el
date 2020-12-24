(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode 1)

;; 日夜自动切换主题
(setq day-theme 'moe-light)
(setq dark-theme 'moe-dark)
(defun synchronize-theme ()
    (setq hour
        (string-to-number
            (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 6 18))
        (setq now day-theme)
        (setq now dark-theme))
    (load-theme now)
)
(run-with-timer 0 3600 'synchronize-theme)


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

(provide 'init-ui)
