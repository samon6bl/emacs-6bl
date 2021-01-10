(provide 'init-tex)
(setq TeX-PDF-mode t)

(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Viewer"))))

(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (add-to-list 'TeX-command-list '("pdfLaTeX" "%`pdflatex -synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-extra-options "-file-line-error -shell-escape")
              (setq TeX-command-default "pdfLaTeX")
              (setq TeX-save-query  nil ) 
              ))

(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))
