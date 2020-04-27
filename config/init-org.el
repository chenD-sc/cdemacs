;;* Code
(with-eval-after-load 'org
  (setq org-startup-folded nil)         ;默认展开内容
  (setq org-startup-indented t)         ;默认缩进内容
  )

(dolist (hook (list
                 'org-mode-hook
                 ))
    (add-hook hook '(lambda ()
                      (require 'org-table-auto-align)
                      (org-table-auto-align-mode)

                      (setq truncate-lines nil) ;自动折行
                      )))
;;*
(add-to-list 'org-file-apps '("\\.pdf\\'" . '(lambda (file &optional link)
                                               (eaf-open file))))


;;* Provide
(provide 'init-org)
