;;* Code 
(add-hook 'prog-mode-hook
          '(lambda ()
             (require 'lazy-load)
             (require 'company)
             (require 'company-yasnippet)
             (require 'company-dabbrev)
             (require 'company-files)
             (require 'company-tng)

             ;; Config for company mode
             (setq company-idle-dely 0.2) ; set the completion menu pop-up delay
             (setq company-minimum-prefix-length 1) ; pop up a completion menu by tapping a character
             (setq company-show-numbers nil) ; do not display numbers on the left
             (setq company-require-match nil) ; allow input string that do not match candidate words

             ;; Customize company backends
             (setq company-backends (delete 'company-xcode company-backends))
             (setq company-backends (delete 'company-bbdb company-backends))
             (setq company-backends (delete 'company-eclim company-backends))
             (setq company-backends (delete 'company-gtags company-backends))
             (setq company-backends (delete 'company-etags company-backends))
             (setq company-backends (delete 'company-oddmuse company-backends))
             (add-to-list 'company-backends 'company-files)

             ;; Use the tab-and-go frontend.
             ;; Allows TAB to select and complete at the same time.
             (company-tng-configure-default)
             (setq company-frontends
                   '(company-tng-frontend
                     company-pseudo-tooltip-frontend
                     company-echo-metadata-frontend))

             ;; Trigger completion immediately.
             (setq company-idle-delay 0)

             ;; Number the candidates (use M-1, M-2 etc to select completions).
             (setq company-show-numbers t)

             ;; Enable global.
             (global-company-mode)

             ;; Don't downcase the returned candidates.
             (setq company-dabbrev-downcase nil)
             (setq company-dabbrev-ignore-case t)

             ;; Add `company-elisp' backend for elisp.
             (add-hook 'emacs-lisp-mode-hook
                       '(lambda ()
                          (require 'company-elisp)
                          (push 'company-elisp company-backends)))

             ;; Key settings.
             (lazy-load-unset-keys
              '("TAB")
              company-mode-map)         ;unset default keys

             (lazy-load-unset-keys
              '("M-p" "M-n" "C-m")
              company-active-map)

             (lazy-load-set-keys
              '(
                ("TAB" . company-complete-selection)
                ("M-h" . company-complete-selection)
                ("M-H" . company-complete-common)
                ("M-w" . company-show-location)
                ("M-s" . company-search-candidates)
                ("M-S" . company-filter-candidates)
                ("M-n" . company-select-next)
                ("M-p" . company-select-previous)
                ("M-i" . yas-expand)
                )
              company-active-map)

             ;; Add yasnippet support for all company backends.
             (defvar company-mode/enable-yas t
               "Enable yasnippet for all backends.")

             (defun company-mode/backend-with-yas (backend)
               (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
                   backend
                 (append (if (consp backend) backend (list backend))
                         '(:with company-yasnippet))))

             (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
             ))

;;* Provide
(provide 'init-company-mode)
