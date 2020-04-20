;;* Unset key
(lazy-load-unset-keys
 '("C-z"))

;;* Global
(keyboard-translate ?\C-h ?\C-p)                         ; swap
(keyboard-translate ?\C-p ?\C-h)                         ; swap

;;* Sdcv
(lazy-load-global-keys
 '(("p" . sdcv-search-pointer)        ; Word at point, show in buffer
   ("y" . sdcv-search-pointer+)       ; Word as point, show in tooltip
   ("i" . sdcv-search-input)          ; input word, show in buffer
   (";" . sdcv-search-input+))
 "init-sdcv"
 "C-z")

(provide 'init-key)

