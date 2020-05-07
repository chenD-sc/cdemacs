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


;; (setq rime-disable-predicates
;;       '(rime-predicate-after-alphabet-char-p
;;         rime-predicate-prog-in-code-p))

;;* Key
(lazy-load-set-keys
 '(
   ("M-o" . rime--backspace)
   ("M-m" . rime--return)
   ("M-h" . rime--escape))
 rime-active-mode-map)


;;* Provide
(provide 'init-rime)
