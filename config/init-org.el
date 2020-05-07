;;* Require
(require 'worf)
(require 'org-agenda)

;;* Config
(with-eval-after-load 'org
  (setq org-startup-folded nil)         ;默认展开内容
  (setq org-startup-indented t)         ;默认缩进内容
  )

;;*
(add-to-list 'org-file-apps '("\\.pdf\\'" . '(lambda (file &optional link)
                                               (eaf-open file))))

;;* Keys
;;** org-mode-map
;; (lazy-load-set-keys
;;  '(
;;    ;; nil
;;    ("C-TAB" . hydra-fast-switch/body)
;;    )
;;  org-mode-map)

;;** org-agenda-mode-map
(lazy-load-set-keys
 '(
   ;; unbind
   ("a" . worf-reserved)
   ("b" . worf-reserved)
   ("c" . worf-reserved)
   ("d" . worf-reserved)
   ("e" . worf-reserved)
   ("f" . worf-reserved)
   ("n" . worf-reserved)
   ("o" . org-agenda-show)
   ("u" . worf-reserved)
   ("w" . worf-reserved)
   ("y" . worf-reserved)
   ("z" . worf-reserved)
   ;; arrows
   ("j" . org-agenda-next-item)
   ("k" . org-agenda-previous-item)
   ("h" . org-agenda-earlier)
   ("l" . org-agenda-later)
   ;; worf
   ("s" . worf-schedule)
   ("N" . worf-agenda-narrow)
   ("w" . worf-agenda-widen)
   ("t" . worf-todo)
   ;; misc
   ("C-j" . org-open-at-point)
   ("i" . org-agenda-clock-in)
   ("o" . org-agenda-clock-out)
   ("0" . digit-argument)
   ("1" . digit-argument)
   ("v" . hydra-org-agenda-view/body)
   ("x" . hydra-org-agenda-ex/body)
   ("S" . org-save-all-org-buffers)
   ("T" . worf-clock-in-and-out)
   ;; disable
   ("f" . nil))
 org-agenda-mode-map)

(defhydra hydra-ora-agenda-ex (:color blue :columns 2)
  "x"
  ("a" org-agenda-archive-default-with-confirmation "archive")
  ("b" org-agenda-earlier "earlier")
  ("c" org-agenda-goto-calendar "calendar")
  ("e" org-agenda-set-effort "effort")
  ("h" org-agenda-holidays "holidays")
  ("i" org-agenda-diary-entry "diary entry")
  ("j" org-agenda-goto-date "goto date")
  ("k" org-agenda-capture "capture")
  ("l" org-agenda-log-mode "log-mode")
  ("o" org-delete-other-windows "one window")
  ("r" org-agenda-redo "redo")
  ("u" org-agenda-bulk-unmark "unmark")
  ("z" org-agenda-add-note "note"))

;;*
(dolist (hook (list
               'org-mode-hook
               ))
  (add-hook hook '(lambda ()
                    (worf-mode)
                    (setq fill-column 90)
                    (auto-fill-mode)
                    (require 'org-table-auto-align)
                    (org-table-auto-align-mode)

                    (setq truncate-lines nil) ;自动折行
                    )))

;;* Provide
(provide 'init-org)
