(require 'python)
(require 'autoinsert)

(require 'lpy)

(setq-default python-shell-interpreter "python3")
;; python-shell-first-prompt-hook
(csetq python-indent-guess-indent-offset nil)

(define-key python-mode-map (kbd "RET") 'newline-and-indent)
(define-key python-mode-map (kbd "C-m") 'python-newline-dedent)

(defun python-newline-dedent ()
  (interactive)
  (if (bolp)
      (newline)
    (newline-and-indent)
    (unless (or (bolp)
                (lispy--in-string-p)))))

(add-hook 'python-mode-hook
          '(lambda ()
             (lpy-mode 1)))

(provide 'init-python)
