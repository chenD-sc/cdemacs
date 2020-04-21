(require 'lispy)

(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'scheme-mode-hook
               ))
  (add-hook hook '(lambda () (lispy-mode 1))))

(provide 'init-lispy)

