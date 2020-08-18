(require 'helm)

(define-key helm-map (kbd "DEL") 'helm-backspace)

(defun helm-backspace ()
  "Forward to `backward-delete-char'.
On error (read-only), quiet without selecting."
  (interactive)
  (condition-case nil
      (backward-delete-char 1)
    (error
     (helm-keyboard-quit))))
