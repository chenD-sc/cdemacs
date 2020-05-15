;;* Require
(require 'rime)

;;* Config
(setq rime-user-data-dir "~/.config/fcitx/rime")

;; (setq rime-posframe-properties
;;       (list :background-color "#333333"
;;             :foreground-color "#dcdccc"
;;             :font "WenQuanYi Micro Hei Mono-14"
;;             :internal-border-width 10))

(setq default-input-method "rime"
      rime-show-candidate 'minibuffer)

;;** Predicates
(setq rime-disable-predicates
      '(;; rime-predicate-auto-english-p   ;
        rime-predicate-after-alphabet-char-p
        rime-predicate-prog-in-code-p
        rime-predicate-hydra-p          ;激活一个 ~hydra~ keymap
        rime-predicate-tex-math-or-command-p ;在（La)Tex 数学环境中或者输入（La)Tex 命令
        ))

;;* Key
(lazy-load-set-keys
 '(
   ("M-o" . rime--backspace)
   ("M-m" . rime--return)
   ("M-h" . rime--escape)
   ;; ("s-j" . rime-inline-ascii)
   )
 rime-active-mode-map)

(lazy-load-set-keys
 '(
   ("s-j" . rime-force-enable))         ;临时强制中文，“一次输入行为”或“取消输入”后关闭
 rime-mode-map)

;;* Provide
(provide 'cda-rime)
