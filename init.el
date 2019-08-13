;;; .emacs.d
;;* Base direcotry and load-path
(defvar emacs-d
  (file-name-directory
   (file-chase-links load-file-name))
  "The giant turtle on which the world rests.")

;;* Font
(defun ora-set-font (&optional frame)
  (when frame
    (select-frame frame))
  (condition-case nil
      (set-frame-font
       "DejaVu Sans Mono")
    (error
     (set-frame-font
      "Lucida Sans Typewriter"))))   
(ora-set-font)
(set-face-attribute 'default nil :height (if (eq system-type 'darwin) 120 113))
(set-fontset-font t nil "Symbola" nil 'append)
(add-hook 'agter-make-frame-functions 'ora-set-font)
;;* Customize
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set) 'set-default) ',variable ,value))
;;** decorations
(csetq tool-bar-mode nil)
(csetq menu-bar-mode nil)
(csetq scroll-bar-mode nil)
(csetq truncate-lines t)
(csetq inhibit-startup-screen t)
(csetq initial-scratch-message "")

