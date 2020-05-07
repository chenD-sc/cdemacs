;;* Global swap key, (C-h, C-p)
(keyboard-translate ?\C-h ?\C-p)                         ; swap
(keyboard-translate ?\C-p ?\C-h)                         ; swap

;;* Unset key
(lazy-load-unset-keys
 '("C-z" "s-x"))

;;* Global set
(global-set-key "\C-u" 'undo)

;;* Sdcv
(lazy-load-global-keys                ; global key unset
 '(("p" . sdcv-search-pointer)        ; word at point, show in buffer
   ("y" . sdcv-search-pointer+)       ; word as point, show in tooltip
   ("i" . sdcv-search-input)          ; input word, show in buffer
   (";" . sdcv-search-input+))
 "init-sdcv"
 "C-z")

;;* Delete block
;; 快速删除光标左右的内容
;; (lazy-load-global-keys
;;  '(
;;    ("M-N" . delete-block-backward)
;;    ("M-M" . delete-block-forward))
;;  "delete-block")

;;* Buffer
;;** Buffer Move
;; 缓存移动

;;** Buffer Edit
;; 缓存编辑
;; (lazy-load-global-keys
;;  '(
;;    ("C-u" . undo-tree-undo)             ;撤销
;;    )
;;  "undo-tree")

;;* Fast switch
(lazy-load-global-keys
 '(
   ("<C-tab>" . hydra-fast-switch/body)
   )
 "init-awesome-tab")

;;* EAF
(lazy-load-global-keys
 '(
   ("s-'" . hydra-eaf-menu/body)
   )
 "init-eaf")

;;* Magit
(lazy-load-global-keys
 '(
   ("C-/" . toggle-input-method)
   )
 "init-rime")

;;* Window Operation
(lazy-load-global-keys
 '(
   ("s-;" . hydra-window-navigation/body)
   )
 "init-window"
 )

;;* Aweshell
(lazy-load-global-keys
 '(
   ("s-n" . aweshell-new)
   ("s-h" . aweshell-toggle)
   ("s-x s-x" . aweshell-dedicated-toggle)
   )
 "aweshell")

;;* Provide
(provide 'init-key)
