(add-hook 'scheme-mode-hook 'cda-scheme-hook)
(add-hook 'python-mode-hook 'cda-python-hook)
;; (add-hook 'markdown-mode-hook 'cda-markdown-hook)
;; (add-hook 'org-mode-hook 'cda-org-hook)
(add-hook 'emacs-lisp-mode-hook 'cda-emacs-lisp-hook)
(add-hook 'lisp-interaction-mode-hook 'cda-lisp-interaction-hook)
;; (eval-after-load 'magit
;;   '(if (featurep 'magit-utils)
;;     (require 'cda-nextmagit)
;;     (add-hook 'magit-status-mode-hook 'cda-magit-status-hook)
;;     (add-hook 'magit-log-mode-hook 'cda-magit-log-hook)
;;     (add-hook 'magit-commit-mode-hook 'cda-magit-commit-hook)
;;     (add-hook 'magit-diff-mode-hook 'cda-magit-diff-hook)
;;     (add-hook 'magit-branch-manager-mode-hook 'cda-magit-branch-manager-hook)))
;; (add-hook 'message-mode-hook 'cda-message-hook)
(add-hook 'eshell-mode-hook 'cda-eshell-hook)
;; (add-hook 'doc-view-mode-hook 'cda-doc-view-hook)
;; (eval-after-load 'helm '(require 'cda-helm))
;; (eval-after-load 'grep
;;   '(define-key grep-mode-map (kbd "C-x C-q") 'wgrep-change-to-wgrep-mode))
;; (eval-after-load 'wgrep
;;   '(progn
;;     (define-key grep-mode-map (kbd "C-c C-c") 'wgrep-finish-edit)
;;     (setq wgrep-auto-save-buffer t)))
(provide 'hooks)