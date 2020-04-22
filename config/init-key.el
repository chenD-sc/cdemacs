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

;;* Awesome-Tab
(lazy-load-set-keys
 '(
   ("s-j" . awesome-tab-ace-jump)     ;ace jump
   ("M-7" . awesome-tab-backward-tab) ;移动到后一标签
   ("M-9" . awesome-tab-forward-tab)  ;移动到前一标签
   ("M-0" . awesome-tab-backward-group)  ;移动到后一个标签组
   ("<C-tab>" . awesome-tab-forward-tab) ;移动到前一个标签组 
   ("<C-S-iso-lefttab>" . awesome-tab-backward-tab) ;移动到前一个标签
   ))

;;* Provide
(provide 'init-key)

