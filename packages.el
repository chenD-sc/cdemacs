;;* packages
(defconst ora-packages
  '(ace-window
    (avy :host github :repo "abo-abo/avy")
    diminish
    (eclipse-theme :host github :repo "abo-abo/eclipse-theme")
    (lispy :host github :repo "abo-abo/lispy")
    slime
    (smex :host github :repo "abo-abo/smex")
    (swiper :host github :repo "abo-abo/swiper")
    use-package)
  "List of packages that I like.")

(setq straight-built-in-pseudo-packages
      '(emacs python uniquify dired dired-x magit cook
        ivy swiper counsel lispy avy ace-window ace-link auto-yasnippet elf-mode
        eltex tiny centimacro helm-j-cheatsheet pamparam
        define-word eclipse-theme function-args gtk-pomodoro-indicator headlong
        ivy-hydra make-it-so orca org-download plain-org-wiki worf))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(dolist (package ora-packages)
  (straight-use-package package))
