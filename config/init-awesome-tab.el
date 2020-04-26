;; Require
(require 'awesome-tab)

;; Code
(setq awesome-tab-style "alternate")
(defhydra hydra-tab (:color pink :hint nil
                            :pre (awesome-tab-mode t)
                            :post (awesome-tab-mode -1))
  "
  ^^Tab                   Group^^       Other^^                 Search
 -^^^^--------------------+-^^----------+-^^--------------------+-^^---------
   ^_H_^    move to left  | _p_  prev   | _d_ kill buffer       | _b_ buffer
 _h_   _l_  switch tab    | _n_  next   | _K_ kill-all-buffers  | _g_ group
   ^_L_^    move to right | _s_  switch | _C-h_ backward window | ^^
 ^^0 ~ 9^^  select window | ^^          | _C-l_ forward window  | ^^
 _^^^^--------------------+-^^----------+-^^--------------------+-^^---------
"
  ;; Tab
  ("h" awesome-tab-backward-tab)
  ("l" awesome-tab-forward-tab)
  ("H" awesome-tab-move-current-tab-to-left)
  ("L" awesome-tab-move-current-tab-to-right)
  ;; Group
  ("p" awesome-tab-backward-group)
  ("n" awesome-tab-forward-group)
  ("s" awesome-ta-switch-group)
  ;; Other
  ("d" spacemacs/kill-this-buffer)
  ("K" awesome-tab-kill-all-buffers-in-current-group)
  ;; ("b" awesome-tab-select-beg-tab)
  ;; ("e" awesome-tab-select-end-tab)
  ("C-h" awesome-tab-backward-tab-other-window)
  ("C-l" awesome-tab-forward-tab-other-window)
  ;; Search
  ("b" ivy-switch-buffer)
  ("g" awesome-tab-counsel-switch-group)
  ("q" nil "quit"))


(provide 'init-awesome-tab)
