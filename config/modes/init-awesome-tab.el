;;* Require
(require 'awesome-tab)
(require 'ace-window)

;;* Config
;;** Setting
(setq awesome-tab-style "alternate")

;;** Select window
(defun s-select-window-by-number (win-id)
  "Use `ace-window to select the window by using window index.
WIN-ID: Window index."
  (let ((wnd (nth (- win-id 1) (aw-window-list))))
    (if wnd
        (aw-switch-to-window wnd)
      (message "No such window."))))

(defun s-select-window ()
  (interactive)
  (let* ((event last-input-event)
         (key (make-vector 1 event))
         (key-desc (key-description key)))
    (s-select-window-by-number
     (string-to-number (car (nreverse (split-string key-desc "-")))))))

;;* Hydra
;; (defhydra hydra-fast-switch (:color pink :hint nil
;;                                     :pre (awesome-tab-mode t)
;;                                     :post (awesome-tab-mode -1))
;;   "
;;   ^^^^Fast Move             ^^^^Tab                    ^^Search     ^^Misc
;;  -^^^^--------------------+-^^^^---------------------+-^^---------+-^^----------------------
;;    ^_k_^    prev group    | _a_^^       select first | _b_ buffer | _x_ kill buffer
;;  _h_   _l_  switch tab    | _e_^^       select last  | _g_ group  | _X_ kill others in group
;;    ^_j_^    next group    | _C-j_^^     ace jump     | ^^         | ^^
;;  ^^0 ~ 9^^  select window | _C-h_/_C-l_ move current | ^^         | ^^
;;  -^^^^--------------------+-^^^^---------------------+-^^---------+-^^----------------------
;; "
;;   ;; fast move
;;   ("h" awesome-tab-backward-tab)
;;   ("l" awesome-tab-forward-tab)
;;   ("k" awesome-tab-backward-group)
;;   ("j" awesome-tab-forward-group)
;;   ("0" s-select-window)
;;   ("1" s-select-window)
;;   ("2" s-select-window)
;;   ("3" s-select-window)
;;   ("4" s-select-window)
;;   ("5" s-select-window)
;;   ("6" s-select-window)
;;   ("7" s-select-window)
;;   ("8" s-select-window)
;;   ("9" s-select-window)
;;   ;; tab
;;   ("a" awesome-tab-select-beg-tab)
;;   ("e" awesome-tab-select-end-tab)
;;   ("C-j" awesome-tab-ace-jump)
;;   ("C-h" awesome-tab-move-current-tab-to-left)
;;   ("C-l" awesome-tab-move-current-tab-to-right)
;;   ;; search
;;   ("b" ivy-switch-buffer)
;;   ("g" awesome-tab-counsel-switch-group)
;;   ;; misc
;;   ("x" kill-current-buffer)
;;   ("X" awesome-tab-kill-all-buffers-in-current-group)

;;   ("q" nil "quit"))

;;* t
(defhydra hydra-tab (:color pink :hint nil
                            :pre (awesome-tab-mode t)
                            :post (awesome-tab-mode -1))
  "Tab Move"
  ("J" awesome-tab-ace-jump "ace-jump")
  ("h" awesome-tab-backward-tab "p-tab")
  ("l" awesome-tab-forward-tab "n-tab")
  ("k" awesome-tab-backward-group "p-group")
  ("j" awesome-tab-forward-group "n-group")

  ("a" awesome-tab-select-beg-tab "beg-tab")
  ("e" awesome-tab-select-end-tab "end-tab")

  ("q" nil "quit"))


;;* Provide
(provide 'init-awesome-tab)
