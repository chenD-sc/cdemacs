;;* Config 1
;; (defun ora-set-font (&optional frame)
;;   (when frame
;;     (select-frame frame))
;;   (condition-case nil
;;       (set-frame-font
;;        "WenQuanYi Micro Hei Mono")
;;     (error
;;      (ignore-errors
;;        (set-frame-font
;;         "Lucida Sans Typewriter")))))
;; (ora-set-font)
;; (set-face-attribute 'default nil :height (if (eq system-type 'darwin) 120 113))
;; (ignore-errors
;;   (set-fontset-font t nil "Symbola" nil 'append))
;; (add-hook 'after-make-frame-functions 'ora-set-font)

;;* Config 2
(let ((emacs-font-size 14)
      emacs-font-name)
  (setq emacs-font-name "WenQuanYi Micro Hei Mono")
  (when (display-grayscale-p)
    (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
    (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name))

    (setq nox-doc-tooltip-font (format "%s-%s" emacs-font-name emacs-font-size))))

(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'width-font-face)
    (set-face-attribute 'width-font-face nil :font "等距更纱黑体 SC 15")
    (setq buffer-face-mode-face 'width-font-face)
    (buffer-face-mode))

  (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))

;;* Provide
(provide 'init-font)
