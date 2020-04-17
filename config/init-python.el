(require 'python)
(require 'lpy)

(setq-default python-shell-interpreter "python3")
(csetq python-indent-guess-indent-offset nil)

(lpy-mode 1)

(provide 'init-python)
