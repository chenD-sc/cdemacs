;;* Base directory and load-path
(defvar emacs-d
  (file-name-directory
   (file-chase-links load-file-name))
  "The giant turtle on which the world rests.")
(defun ora-add-subdirs (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(ora-add-subdirs (expand-file-name "git/" emacs-d))
(add-to-list 'load-path (expand-file-name "modes/" emacs-d))


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
(set-face-attribute 'default nil :height (if (eq system-type 'darwin) 120 113))
(ignore-errors
  (set-fontset-font t nil "Symbola" nil 'append))
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
;;** minibuffer interaction
(csetq enable-recursive-minibuffers t)
(setq minibuffer-message-timeout 1)
(minibuffer-depth-indicate-mode 1)
(csetq read-quoted-char-radix 16)
;;** editor behavior
(defalias 'yes-or-no-p 'y-or-n-p)
(csetq eval-expression-print-length nil)
(csetq eval-expression-print-level nil)
;;** Internals
(csetq gc-cons-threshold (* 10 1024 1024))
(csetq ad-redefinition-action 'accept)
;;** time display
(csetq display-time-24hr-format t)
(csetq display-time-default-load-average nil)
(csetq display-time-format "")
;;** Rest
(csetq browse-url-browser-function 'browse-url-firefox)
(csetq browse-url-firefox-program "firefox")
;;* Bootstrap
;;** enable features
(mapc (lambda (x) (put x 'disabled nil))
      '(erase-buffer upcase-region downcase-region
        dired-find-alternate-file narrow-to-region))
;;** theme
(let ((file-name-handler-alist nil))
  (require 'eclipse-theme))

;;* Modes
;;** global minor modes
(with-temp-message ""
  (require 'lispy))

;;* Use Package
;;** keys
(require 'ora-keys)
