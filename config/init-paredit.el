(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(dolist (hook (list
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               ))
  (add-hook hook '(lambda () (paredit-mode 1))))

(provide 'init-paredit)
