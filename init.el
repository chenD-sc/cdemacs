;;; oremacs
;;* Base directory and load-path
(defvar emacs-d user-emacs-directory)
(add-to-list 'load-path emacs-d)
(add-to-list 'load-path (expand-file-name "modes/" emacs-d))
(setq enable-local-variables :all)

;;* straight.el
;; (require 'ora-straight)
(if t
    (require 'ora-straight)
  (setq package-user-dir (expand-file-name "elpa" emacs-d))
  (package-initialize))

;;* Font
(defun ora-set-font (&optional frame)
  (when frame
    (select-frame frame))
  (condition-case nil
      (set-frame-font
       "DejaVu Sans Mono")
    (error
     (ignore-errors
       (set-frame-font
	"Lucida Sans Typewriter")))))
(ora-set-font)
(set-face-attribute 'default nil :height (if (eq system-type 'drawin) 120 113))
(ignore-errors
  (set-fontset-font t nil "symbol" nil 'append))
(add-hook 'after-make-frame-functions 'ora-set-font)
;;* Customize
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set) 'set-default) ',variable ,value))
(defun ora-advice-add (&rest args)
  (when (fboundp 'advice-add)
    (apply #'advice-add args)))
;;** decorations
(csetq tool-bar-mode nil)
(csetq menu-bar-mode nil)
(csetq scroll-bar-mode nil)
(csetq truncate-lines t)
(csetq inhibit-startup-screen t)
(csetq initial-scratch-message "")
(csetq text-quoting-style 'grave)
(csetq line-number-display-limit-width 2000000)
;;** navigation within buffer
(csetq next-screen-context-lines 5)
(csetq recenter-positions '(top middle bottom))
;;** finding files
(csetq vc-follow-symlinks t)
(csetq find-file-suppress-same-file-warnings t)
(csetq read-file-name-completion-ignore-case t)
(csetq read-buffer-completion-ignore-case t)
(prefer-coding-system 'utf-8)
;;* minibuffer interaction
(csetq enable-recursive-minibuffers t)
(setq minibuffer-message-timeout t)
(minibuffer-depth-indicate-mode 1)
(csetq read-quoted-char-radix 16)
;;** editor behavior
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
;; imporve copying from a ssh -X Emacs.
(setq x-selection-timeout 100)
(csetq lpr-command "gtklp")
;;** internals
(csetq gc-cons-threshold (* 10 1024 1024))
(csetq ad-redefinition-action 'accept)
;;** time display
(csetq display-time-24hr-format t)
(csetq display-time-default-load-average nil)
(csetq display-time-format "")
;;** Rest
(csetq browse-url-browser-function 'browse-url-firefox)
(csetq browse-url-firefox-program "firefox")
;;*** Backups
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t)
(setq version-control t)
(setq create-lockfiles nil)
;;* Bootstrap
;;** autoloads

;;** enable features

;;**
(let ((file-name-handler-alist nil))
  (require 'eclipse-theme)
  (load-theme 'eclipse t)
  (require 'use-package)
  (require 'smex))


;;* Modes
;;** global minor modes
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(when (fboundp 'global-eldoc-mode) (global-eldoc-mode -1))
(defun eldoc-mode (&rest _))
(show-paren-mode t)
(winner-mode 1)
(remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)
(use-package recentf
  :config
  (setq recentf-exclude '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
                          "[0-9a-f]\\{32\\}-[0-9a-f]\\{32\\}\\.org"
                          ".*png$" ".cache$"))
  (setq recentf-max-saved-items 600))
(eval-after-load 'xref
  '(progn
     (setq xref-pulse-on-jump nil)
     (setq xref-after-return-hook nil)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(use-package diminish)
(require 'ora-ivy)

;;*
(lispy-mode)
