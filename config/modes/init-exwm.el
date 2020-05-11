;;* Require
(require 'exwm)
(require 'exwm-randr)
(require 'exwm-xim)

;;* Workspace
(setq exwm-workspace-number 4)

;;* Global key bindings
(setq exwm-input-global-keys
      `(
        ;; bind: exit char-mode and fullscreen mode
        ([?\s-r] . exwm-reset)
        ;; bind: switch workspace interactively
        ([?\s-w] . exwm-workspace-switch)
        ;; switch workspace by its index
        (\,@ (mapcar (lambda (i)
                       `(,(kbd (format "s-%d" i)) .
                         (lambda ()
                           (interactive)
                           (exwm-workspace-switch-create ,i))))
                     (number-sequence 0 9)))
        ;; launch applications
        ([?\s-d] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ;; bind: "slock", a simple x display locker
        ([s-f2] . (lambda ()
                    (interactive)
                    (start-process "" nil "/usr/bin/slock")))))

;;*
;; To add a key binding only available in line-mode, simply define it in `exwm-mode-map'.
;; shortens 'C-c q' to 'C-q'
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;;
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-title))
              (exwm-workspace-rename-buffer exwm-title))))


;;*
(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-b] . [left])
        ([?\M-b] . [C-left])
        ([?\C-f] . [right])
        ([?\M-f] . [C-right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ;; cut/paste
        ([?\C-w] . [?\C-x])
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ;; search
        ([?\C-s] . [?\C-f])))

;;* Multi-monitor
;; (setq exwm-randr-workspace-output-plist '(0 "eDP-1"))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "xrandr --output eDP-1 --left-of HDMI-2 --auto")))
;; (defun exwm-change-screen-hook ()
;;   (let ((xrandr-output-regexp "\n\\([^ ]+\\) connected")
;;         default-output)
;;     (with-temp-buffer
;;       (call-process "xrandr" nil t nil)
;;       (goto-char (point-min))
;;       (re-search-forward xrandr-output-regexp nil 'noerror)
;;       (setq default-output (match-string 1))
;;       (forward-line)
;;       (if (not (re-search-forward xrandr-output-regexp nil 'noerror))
;;           (call-process "xrandr" nil nil nil "--output" default-output "--auto")
;;         (call-process
;;          "xrandr" nil nil nil
;;          "--output" (match-string 1) "--primary" "--auto"
;;          "--output" default-output "--off")
;;         (setq exwm-randr-workspace-output-plist (list 0 (match-string 1)))))))
;; (add-hook 'exwm-randr-screen-change-hook 'exwm-change-screen-hook)

;; (exwm-randr-enable)

;;* Input method
;; (exwm-xim-enable)
;; (push ?\C-\\ exwm-input-prefix-keys)

(provide 'init-exwm)
