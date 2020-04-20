;;* config1
(require 'geiser-mode)
(require 'lispy)
(define-key geiser-mode-map (kbd "C-.") nil)
(define-key geiser-mode-map (kbd "C-c C-l") 'geiser-eval-buffer)
(setq scheme-program-name "/usr/bin/scheme")
(setq geiser-active-implementations '(chez))
(setq geiser-mode-autodoc-p nil)

(defun scheme-completion-at-point ()
  (let* ((bnd (bounds-of-thing-at-point 'symbol))
         (prefix (lispy--string-dwim bnd)))
    (with-current-buffer (geiser-repl--buffer-name geiser-impl--implementation)
      (list (car bnd) (cdr bnd)
            (geiser-completion--symbol-list prefix)))))

(setq prettify-symbols-alist
      '(("lambda" . ?λ)))
(setq-local lispy-outline-header ";;")
(prettify-symbols-mode)
(geiser-mode)
(lispy-mode)
(setq-local completion-at-point-functions '(scheme-completion-at-point))


;; * config2
;; (require 'cmuscheme)
;; (setq scheme-program-name "/usr/bin/scheme")

;; (defun scheme-proc ()
;;   "Return the current Scheme process, starting one if necessary."
;;   (unless (and scheme-buffer
;;                (get-buffer scheme-buffer)
;;                (comint-check-proc scheme-buffer))
;;     (save-window-excursion
;;       (run-scheme scheme-program-name)))
;;   (or (scheme-get-process)
;;       (error "No current process. See variable `scheme-buffer'")))

;; (defun scheme-split-window ()
;;   (cond
;;    ((=1 (count-windows))
;;     (delete-other-windows)
;;     (split-window-verticallly (floor (* 0.68 (window-height))))
;;     (other-window 1))
;;    ((not (find "*scheme*"
;;                (mapcar (lambda (w) (buffer-name (window-buffer w)))
;;                        (window-list))
;;                :test 'equal))
;;     (other-window 1)
;;     (switch-to-buffer "*scheme*")
;;     (other-window -1))))

;; (defun scheme-send-last-sexp-split-window ()
;;   (interactive)
;;   (scheme-split-window)
;;   (scheme-send-last-sexp))

;; (defun scheme-send-definition-split-window ()
;;   (interactive)
;;   (scheme-split-window)
;;   (scheme-send-definition))

;; (add-hook 'scheme-mode-hook
;;           (lambda ()
;;             (paredit-mode 1)
;;             (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
;;             (define-key scheme-mode-map (kbd "<f7>") 'scheme-send-definition-split-window)))

;;* provide 
(provide 'init-scheme)
