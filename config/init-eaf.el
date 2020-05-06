;;* Custom
(require 'eaf)

;; Self token, generate at https://github.com/settings/tokens/new?scopes=
;; Setting token will avoid block off by github API times limit.
(setq eaf-grip-token "a8f9de0c86fc7ce6f84a09fff94ebf01c85bf7ff")

;; Need configuration own local proxy program first.
(setq eaf-proxy-type "socks5")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "1090")

(eaf-setq eaf-browser-default-zoom "1.00")
(eaf-setq eaf-browser-blank-page-url "https://www.startpage.com")
(eaf-setq eaf-browser-aria2-proxy-host "127.0.0.1")
(eaf-setq eaf-browser-aria2-proxy-host "9888")
(eaf-setq eaf-terminal-font-size "18")

(eaf-setq eaf-marker-letters "JKHLNMUIOYPFDSAVCRREW")

;; (defun jekyll-start-server ()
;;   (interactive)
;;   (eaf-run-command-in-terminal "jekyll serve --livereload" "/home/andy/manateelazycat.github.io"))

(defun jekyll-open-local ()
  (interactive)
  (eaf-open-browser "http://127.0.0.1:4000"))

;;* Key
(eaf-bind-key undo_action "C-/" eaf-browser-keybinding)
(eaf-bind-key redo_action "C-?" eaf-browser-keybinding)
(eaf-bind-key scroll_up "M-j" eaf-browser-keybinding)
(eaf-bind-key scroll_down "M-k" eaf-browser-keybinding)
(eaf-bind-key scroll_up_page "M-n" eaf-browser-keybinding)
(eaf-bind-key scroll_down_page "M-p" eaf-browser-keybinding)
(eaf-bind-key open_link "M-h" eaf-browser-keybinding)
(eaf-bind-key open_link_new_buffer "M-H" eaf-browser-keybinding)
(eaf-bind-key insert_or_open_link_new_buffer "D" eaf-browser-keybinding)
(eaf-bind-key insert_or_open_link_background_buffer "F" eaf-browser-keybinding)
(eaf-bind-key watch-other-window-up-line "M-<" eaf-browser-keybinding)
(eaf-bind-key watch-other-window-down-line "M->" eaf-browser-keybinding)
(eaf-bind-key emacs-session-save "<f5>" eaf-browser-keybinding)
(eaf-bind-key refresh_page "M-r" eaf-browser-keybinding)

(defhydra hydra-eaf-menu (:color pink
                                 :hint nil
                                 :exit t)
  "
^App^                ^File^         ^Qrcode^      ^Other
^^^^^^^^-----------------------------------------------------
_b_: browser         _o_: open      _s_: qrcode   _d_: demo
_B_: browser history _O_: office    _S_: dired
_t_: terminal        _C_: mindmap-c _i_: browser
_m_: mail            _c_: mindmap-o _a_: airshare
_r_: rss
_p_: camera
"
  ("b" eaf-open-browser)              ;Search or Goto URL
  ("B" eaf-open-browser-with-history) ;Search or Goto URL or Goto History
  ("p" eaf-open-camera)
  ("m" eaf-open-mail-as-html)       ;HTML MAIL: in gnus, mu4e, notmuch
  ("o" eaf-open) ;File: PDF, Video, Image, Markdown, Org, Mermaid(*.mmd)
  ("t" eaf-open-terminal)
  ("s" eaf-file-sender-qrcode)
  ("S" eaf-file-sender-qrcode-in-dired)
  ("i" eaf-file-browser-qrcode)
  ("a" eaf-open-airshare)
  ("r" eaf-open-rss-reader)
  ("C" eaf-create-mindmap)
  ("c" eaf-open-mindmap)
  ("O" eaf-open-office)
  ("d" eaf-open-demo)                   ;Verify basic functionality

  ("q" nil "quit")
  )

;;* Provide
(provide 'init-eaf)
