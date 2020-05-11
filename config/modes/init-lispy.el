(require 'lispy)

(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'scheme-mode-hook
               ))
  (add-hook hook '(lambda () (lispy-mode 1))))

(defun conditionally-enable-lispy ()
  (when (eq this-command 'eval-expression)
    (lispy-mode 1)))
(add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

(provide 'init-lispy)
