;;* c1
(require 'geiser-mode)
(setq scheme-program-name "/usr/bin/scheme")
(setq geiser-active-implementations '(chez))
(setq geiser-mode-autodoc-p nil)

(define-key geiser-mode-map (kbd "C-.") nil)
(define-key geiser-mode-map (kbd "C-c C-l") 'geiser-eval-buffer)

(defun scheme-completion-at-point ()
  (let* ((bnd (bounds-of-thing-at-point 'symbol))
         (prefix (lispy--string-dwim bnd)))
    (with-current-buffer (geiser-repl--buffer-name geiser-impl--implementation)
      (list (car bnd) (cdr bnd)
            (geiser-completion--symbol-list prefix)))))

;; for output error info correctly in chez
;; redefun the function `lispy--eval-scheme in le-scheme.el(lispy)
(eval-after-load 'le-scheme
  '(progn
    (defun lispy--eval-scheme (str)
      "Eval STR as Scheme code."
      (unless (geiser-repl--connection*)
        (save-window-excursion
          (if geiser-impl--implementation
              (run-geiser geiser-impl--implementation)
            (call-interactively 'run-geiser))
          (geiser-mode 1)))
      (when (string-match "(\\(?:define\\|set!\\|struct\\)[ (]+\\(\\(?:\\w\\|\\s_\\)+\\)" str)
        (let ((name (match-string 1 str)))
          (setq str (format "(begin %s %s)" str name))))
      (with-current-buffer (geiser-repl--buffer-name geiser-impl--implementation)
        (let* ((code `(:eval (:scm ,str)))
               (ret (geiser-eval--send/wait code))
               (err (geiser-eval--retort-error ret))
               (output-str (cdr (assoc 'output ret)))
               (result-str (cadr (assoc 'result ret)))
               (error-str (cdr (cadr (assoc 'error ret)))) ; add error-str
               )
          (cond (err
                 (format "Error: %s" (string-trim error-str)))
                ((not (equal "" output-str))
                 (concat
                  (propertize
                   output-str
                   'face 'font-lock-string-face)
                  "\n"
                  result-str))
                (t
                 result-str)))))
    ))


;;;###autoload
(defun cda-scheme-hook ()
  (setq prettify-symbols-alist
        '(("lambda" . ?λ)))
  (setq-local lispy-outline-header ";;")
  (prettify-symbols-mode)
  (geiser-mode)
  (lispy-mode)
  (company-mode -1)
  ;; (lispy--eval-scheme)
  (setq-local completion-at-point-functions '(scheme-completion-at-point)))

;;* c2
;; (require 'cmuscheme)
;; (defun scheme-split-window ()
;;   (cond
;;     ((= 1 (count-windows))
;;      (delete-other-windows)
;;      (split-window-vertically (floor (* 0.68 (window-height))))
;;      (other-window 1)
;;      (switch-to-buffer "*scheme*")
;;      (other-window 1))
;;     ((not (find "*scheme*"
;;                 (mapcar (lambda (w) (buffer-name (window-buffer w)))
;;                         (window-list))
;;                 :test 'equal))
;;      (other-window 1)
;;      (switch-to-buffer "*scheme*")
;;      (other-window -1))))

;; (setq scheme-program-name "scheme")

;; (defun scheme-proc ()
;;   "Return the current Scheme process, starting one if necessary."
;;   (unless (and scheme-buffer
;;                (get-buffer scheme-buffer)
;;                (comint-check-proc scheme-buffer))
;;     (save-window-excursion
;;       (run-scheme scheme-program-name)))
;;   (or (scheme-get-process)
;;       (error "No current process. See variable `scheme-buffer'")))

;; (defun scheme-send-last-sexp-split-window ()
;;   (interactive)
;;   (scheme-split-window)
;;   (scheme-send-last-sexp))

;; (defun scheme-send-definition-split-window ()
;;   (interactive)
;;   (scheme-split-window)
;;   (scheme-send-definition))

;; ;;;###autoload
;; (defun cda-scheme-hook ()
;;   (setq prettify-symbols-alist
;;         '(("lambda" . ?λ)))
;;   (setq-local lispy-outline-header ";;")
;;   (prettify-symbols-mode)
;;   (lispy-mode)
;;   (company-mode -1)
;;   (setq-local completion-at-point-functions '(scheme-send-last-sexp-split-window)
;;   ;; (define-key scheme-mode-map (kbd "M-ν") 'scheme-send-last-sexp-split-window)
;;   ;; (define-key scheme-mode-map (kbd "M-<f6>") 'scheme-send-definition-split-window)
;;   ))
