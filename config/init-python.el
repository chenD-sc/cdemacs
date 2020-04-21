;; Require
(require 'python)
(require 'lpy)

;; Code
(setq-default python-shell-interpreter "python3")
(csetq python-indent-guess-indent-offset nil)

(add-hook 'python-mode-hook
          '(lambda ()
             (lpy-mode 1)))

(provide 'init-python)
