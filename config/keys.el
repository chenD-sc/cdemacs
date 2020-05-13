;;* keys -*- lexical-binding: t -*-
;;* Ctrl shortcuts
(global-set-key "\C-a" 'cda-move-beginning-of-line) ; 'move-beginning-of-line
;; (global-set-key "\C-b" 'backward-char)                ; default
;; (global-set-key "\C-c" 'mode-specific-command-prefix) ; default
;; (global-set-key "\C-d" 'delete-char)                  ; default
;; (global-set-key "\C-e" 'move-end-of-line)             ; default
;; (global-set-key "\C-f" 'forward-char)                 ; default
;; (global-set-key "\C-g" 'keyboard-quit)                ; default
;; (global-set-key "\C-h" nil)                           ; 'help-command
;; (global-set-key "\C-i" 'indent-for-tab-command)       ; default
(global-set-key (kbd "C-i") 'indent-for-tab-command)
;; (global-set-key "\C-j" 'newline)                      ; default
;; (global-set-key "\C-k" 'kill-line)                    ; default
;; (global-set-key "\C-l" 'recenter-top-bottom)          ; default
;; (global-set-key "\C-m" 'newline-and-indent)           ; default
;; (global-set-key "\C-n" 'next-line)                    ; default
(global-set-key "\C-o" 'ora-open-line)                   ; 'open-line
(keyboard-translate ?\C-h ?\C-p)                         ; swap
(keyboard-translate ?\C-p ?\C-h)                         ; swap
;; (global-set-key "\C-q" 'quoted-insert)                ; default
(global-set-key "\C-r" 'counsel-grep-or-swiper)          ; 'isearch-backward
(global-set-key "\C-s" 'swiper)                          ; 'isearch-forward
(global-set-key "\C-t" 'smex)                            ; 'transpose-chars
(global-set-key "\C-u" 'undo)                            ; 'universal-argument
;; (global-set-key "\C-v" 'scroll-up)                    ; default
;; (global-set-key "\C-w" 'kill-region)                  ; default
;; (global-set-key "\C-x")                               ; default
;; (global-set-key "\C-y" 'yank)                         ; default
;; (global-set-key (kbd "C-z") 'capitalize-word-toggle)
                                        ; capitili[z]e
(global-set-key (kbd "C-.") 'comment-dwim)

;;* Ctrl Meta shortcuts

;;* Hydras
(require 'hydra-examples)
(defhydra hydra-window (:color red
                               :columns nil)
  "window"
  ("h" windmove-left nil)
  ("j" windmove-down nil)
  ("k" windmove-up nil)
  ("l" windmove-right nil)
  ("H" hydra-move-splitter-left nil)
  ("J" hydra-move-splitter-down nil)
  ("K" hydra-move-splitter-up nil)
  ("L" hydra-move-splitter-right nil)
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
   "vert")
  ("x" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
   "horz")
  ("t" transpose-frame "'" :exit t)
  ("o" delete-other-windows "one" :exit t)
  ("a" ace-window "ace")
  ("s" ace-swap-window "swap")
  ("d" ace-delete-window "del")
  ("i" ace-maximize-window "ace-one" :exit t)
  ("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump "bmk")
  ("q" nil "cancel")
  ("u" (progn (winner-undo) (setq this-command 'winner-undo)) "undo")
  ("f" nil))

(global-set-key (kbd "C-M-o") 'hydra-window/body)



;;* Unset key
(lazy-load-unset-keys
 '("C-z" "s-x"))

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
   ("<C-tab>" . hydra-tab/body)
   )
 "init-awesome-tab")

;;* Dired
;; (lazy-load-global-keys
;;  '(
;;    ("<f8>" . dired-jump)
;;    ("C-x C-f" . find-file)
;;    )
;;  "init-dired")

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

;;* Window
;;** Operation
(lazy-load-set-keys
 '(
   ("C-c v" . split-window-vertically)   ;纵向分割窗口
   ("C-c h" . split-window-horizontally) ;横向分割窗口
   ("C-;" . kill-this-buffer)            ;关闭当前buffer
   ("C-x ;" . delete-other-windows)      ;关闭其它窗口
   ))
;; Multi-Scratch
(lazy-load-global-keys
 '(
   ("s-Q" . multi-scratch-new))
 "multi-scratch")

(lazy-load-global-keys
 '(
   ("s-;" . hydra-window-navigation/body)
   )
 "init-window"
 )

(lazy-load-global-keys
 '(
   ("C-c V" . delete-other-windows-vertically+) ;关闭上下的其他窗口
   ("C-c H" . delete-other-windows-horizontally+) ;关闭左右的其他窗口
   ("C-'" . delete-current-buffer-and-window) ;关闭当前buffer,并关闭窗口
   ("C-\"" . delete-current-buffer-window)    ;删除当前buffer的窗口
   ("M-s-o" . toggle-one-window)              ;切换一个窗口
   ("C-x O" . toggle-window-split))
 "window-extension")

;;** Watch other window
(lazy-load-global-keys
 '(
   ("s-J" . watch-other-window-up)        ;向下滚动其他窗口
   ("s-K" . watch-other-window-down)      ;向上滚动其他窗口
   ("s-<" . watch-other-window-up-line)   ;向下滚动其他窗口一行
   ("s->" . watch-other-window-down-line) ;向上滚动其他窗口一行
   )
 "watch-other-window")

;;* Aweshell
(lazy-load-global-keys
 '(
   ("s-n" . aweshell-new)
   ("s-h" . aweshell-toggle)
   ("s-x s-x" . aweshell-dedicated-toggle)
   )
 "aweshell")

;;* Provide
(provide 'keys)
