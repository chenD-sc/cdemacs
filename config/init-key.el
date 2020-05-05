;;* Unset key
(lazy-load-unset-keys
 '("C-z"))

;;* Global swap key, (C-h, C-p)
(keyboard-translate ?\C-h ?\C-p)                         ; swap
(keyboard-translate ?\C-p ?\C-h)                         ; swap

;;* Sdcv
(lazy-load-global-keys                ; global key unset
 '(("p" . sdcv-search-pointer)        ; word at point, show in buffer
   ("y" . sdcv-search-pointer+)       ; word as point, show in tooltip
   ("i" . sdcv-search-input)          ; input word, show in buffer
   (";" . sdcv-search-input+))
 "init-sdcv"
 "C-z")

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
   ("s-m" . toggle-input-method)
   )
 "init-rime")

;;* Window Operation
(lazy-load-global-keys
 '(
   ("s-;" . hydra-window-navigation/body)
   )
 "init-window"
 )


;;* Provide
(provide 'init-key)
