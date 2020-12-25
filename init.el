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
(require 'org-tempo)
(require 'posframe)
(require 'org-protocol-capture-html)
(require 'init-markdown)
(require 'init-bibtex)




;;; ----------------------------------------------------------- Customize --------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "eb3ef63dc31fbebb37df3646fbc1e07f25159d19bb1cade2a80000a2764690de" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" default))
 '(elfeed-feeds
   '("https://rsshub.ioiox.com/bilibili/bangumi/media/28229899" "https://samon6bl.github.io/rss.xml"))
 '(helm-completion-style 'emacs)
 '(org-agenda-files
   '("~/Nextcloud/roam notes/20201219222415-material.org" "/Users/apple/Nextcloud/agenda/Idea.org" "/Users/apple/Nextcloud/agenda/Tips.org" "/Users/apple/Nextcloud/agenda/archived.org" "/Users/apple/Nextcloud/agenda/area.org" "/Users/apple/Nextcloud/agenda/inbox.org" "/Users/apple/Nextcloud/agenda/journal.org" "/Users/apple/Nextcloud/agenda/project.org" "/Users/apple/Nextcloud/agenda/resource.org" "/Users/apple/Nextcloud/agenda/task.org"))
 '(org-download-screenshot-method "screencapture -i %s")
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-preview-latex-default-process 'dvipng)
 '(org-preview-latex-process-alist
   '((dvipng :programs
	     ("latex" "dvipng")
	     :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
	     (1.0 . 1.0)
	     :latex-compiler
	     ("latex -interaction nonstopmode -output-directory %o %f")
	     :image-converter
	     ("dvipng -D %D -T tight -o %O %f"))
     (dvisvgm :programs
	      ("latex" "dvisvgm")
	      :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
	      (1.7 . 1.5)
	      :latex-compiler
	      ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
	      :image-converter
	      ("dvisvgm %f -n -b min -c %S -o %O"))
     (imagemagick :programs
		  ("latex" "convert")
		  :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		  (1.0 . 1.0)
		  :latex-compiler
		  ("xelatex -interaction nonstopmode -output-directory %o %f")
		  :image-converter
		  ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(package-selected-packages
   '(pyvenv ivy org all-the-icons-dired flycheck company smooth-scrolling hungry-delete swiper counsel smartparens popwin reveal-in-osx-finder neotree switch-window projectile markdown-mode exec-path-from-shell elpy company-jedi dracula-theme solarized-theme use-package org-noter let-alist tablist org-pdftools org-noter-pdftools org-superstar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
