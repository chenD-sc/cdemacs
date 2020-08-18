(require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

(setq exwm-input-global-keys
      `(
        ;; Bind "s-r" to exit char-mode and fullscreen mode.
        ([?\s-r] . exwm-reset)
        ;; Bind "s-w" to switch workspace interactively.
        ([?\s-w] . exwm-workspace-switch)
        ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
        (\,@ (mapcar (lambda (i)
                       `(,(kbd (format "s-%d" i)) .
                          (lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
                     (number-sequence 0 9)))
        ;; Bind "s-&" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\s-&] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ;; Bind "s-<f2>" to "slock", a simple x display locker.
        ([s-f2] . (lambda ()
                    (interactive)
                    (start-process "" nil "/usr/bin/slock")))))

;; Multi-monitor
;; (require 'exwm-randr)
;; (setq exwm-randr-workspace-output-plist '(1 "DP-1"))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrand" nil "xrandr --output DP-1 --right-of DP-2 --auto")))
;; (exwm-randr-enable)

(exwm-enable)

(provide 'cda-exwm)