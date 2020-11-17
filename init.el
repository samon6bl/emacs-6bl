(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-text)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-org)
(require 'init-device)
(require 'init-auctex)
(require 'init-shell)
(require 'init-python)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" default))
 '(package-selected-packages
   '(flycheck company smooth-scrolling hungry-delete swiper counsel smartparens popwin reveal-in-osx-finder neotree switch-window projectile markdown-mode exec-path-from-shell elpy company-jedi dracula-theme solarized-theme use-package org-noter let-alist tablist org-pdftools org-noter-pdftools org-superstar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
