(provide 'init-markdown)
(defun haotianmichael/markdown-to-html ()
  (interactive)
  (start-process "grip" "*gfm-to-html*" "grip" (buffer-file-name) "5000")
  (browse-url (format "http://localhost:5000/%s.%s" (file-name-base) (file-name-extension (buffer-file-name)))))
(global-set-key (kbd "C-c m")   'haotianmichael/markdown-to-html)  ;给给函数绑定一个快捷键
