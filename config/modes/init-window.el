;;* Require
(require 'buffer-move)
(require 'windresize)
(require 'windresize-extension)
(require 'list-register)

;;* Hydra
(defhydra hydra-window-navigation (:color pink :hint nil)
  "
  ^^^^Wind-Move  ^^^^Buf-Move  ^^^^Wind-Enlarge   ^^^^Wind-Shrink   ^^Ward-Wind   ^^ Delete             ^^Register     ^^Split
 -^^^^---------+-^^^^--------+--^^^^------------+--^^^^-----------+-^^----------+-^^------------------+-^^-----------+-^^---------------
     ^_k_^     |    ^_d_^    |      ^_i_^       |      ^_,_^      | _x_ outward | _:_ kill other wind | _e_ list     | _g_ horizontally
   _h_   _l_   |  _a_   _f_  |    _y_   _o_     |    _n_   _._    | _c_ inward  | _'_ kill buf & wind | _r_ remember | _v_ vertically
     ^_j_^     |    ^_s_^    |      ^_u_^       |      ^_m_^      | ^^          | ^^                  | _t_ jump     | ^^
 -^^^^---------+-^^^^--------+--^^^^------------+--^^^^-----------+-^^----------+-^^------------------+-^^-----------+-^^---------------
"
  ;; Window move
  ("j" windmove-down)
  ("k" windmove-up)
  ("h" windmove-left)
  ("l" windmove-right)
  ;; Buffer move
  ("s" buf-move-down)
  ("d" buf-move-up)
  ("a" buf-move-left)
  ("f" buf-move-right)
  ;; Window resize: enlarge
  ("u" (lambda () (interactive) (windresize-up-inwards '-1))) ; Enlarge Down
  ("i" (lambda () (interactive) (windresize-down-inwards '-1))) ; Enlarge Up
  ("y" (lambda () (interactive) (windresize-right-inwards '-1))) ; Enlarge Left
  ("o" (lambda () (interactive) (windresize-left-inwards '-1))) ; Enlarge Right
  ;; Window resize: shrink
  ("m" (lambda () (interactive) (windresize-up-inwards '1))) ; Shrink Down
  ("," (lambda () (interactive) (windresize-down-inwards '1))) ; Shrink Up
  ("n" (lambda () (interactive) (windresize-right-inwards '1))) ; Shrink Left
  ("." (lambda () (interactive) (windresize-left-inwards '1))) ; Shrink Right
  ;; Inward & outward window
  ("x" outward-window)
  ("c" inward-window)
  ;; Delete
  (":" delete-other-windows)
  ("'" delete-current-buffer-and-window)
  ;; Registers
  ("e" list-register)                   ; List Registers
  ("r" frame-configuration-to-register) ; Remember Registers
  ("t" jump-to-register)                ; Jump Register
  ;; Split
  ("g" split-window-horizontally)
  ("v" split-window-vertically)

  ("q" nil "quit"))

;;* Provide
(provide 'init-window)
