;; ### Customize ###
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set) 'set-default) ',variable ,value))
(defun ors-advice-add (&rest args)
  (when (fboundp 'advice-add)
    (apply #'advice-add args)))

;;* decorations
(csetq tool-bar-mode nil)
(csetq menu-bar-mode nil)
(csetq scroll-bar-mode nil)
(csetq truncate-lines t)
(csetq inhibit-startup-screen t)
(csetq initial-scratch-message "")
(csetq text-quoting-style 'grave)
(csetq line-number-display-limit-width 2000000)

;;* navigation within buffer
(csetq next-screen-context-lines 5)
(csetq recenter-positions '(top middle bottom))

;;* finding files
(csetq vc-follow-symlinks t)
(csetq find-file-suppress-same-file-warnings t)
(csetq read-file-name-completion-ignore-case t)
(csetq read-buffer-completion-ignore-case t)
(prefer-coding-system 'utf-8)

;;* minibuffer interaction
(csetq enable-recursive-minibuffers t)
(setq minibuffer-message-timeout 1)
(minibuffer-depth-indicate-mode 1)
(csetq read-quoted-char-radix 16)

;;* editor behavior
(csetq indent-tabs-mode nil)
(csetq ring-bell-function 'ignore)
(csetq highlight-nonselected-windows nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions nil)
(add-hook 'server-switch-hook 'raise-frame)
(defadvice set-window-dedicated-p (around no-dedicated-windows activate))
(remove-hook 'post-self-insert-hook 'blink-paren-post-self-insert-function)
(csetq eval-expression-print-length nil)
(csetq eval-expression-print-level nil)
(setq print-gensym nil)
(setq print-circle nil)
(setq byte-compile--use-old-handlers nil)
;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(setq x-selection-timeout 10)
;; improves copying from a ssh -X Emacs.
(setq x-selection-timeout 100)
(csetq lpr-command "gtklp")

;;* internals
(csetq gc-cons-threshold (* 10 1024 1024))
(csetq ad-redefinition-action 'accept)

;;* time display
(csetq display-time-24hr-format t)
(csetq display-time-default-load-average nil)
(csetq display-time-format "")

;;* browser 
(csetq browse-url-browser-function 'eaf-open-browser)
(defalias 'browse-web #'eaf-open-browser)

;;* rest 
(blink-cursor-mode -1)

(provide 'init-customize)
