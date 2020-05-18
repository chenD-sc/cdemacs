;;

;;;### (autoloads nil "init" "init.el" (0 0 0 0))
;;; Generated autoloads from init.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init" '("browse-web" "cda-" "csetq" "eldoc-mode" "emacs-d" "yes-or-no-p")))

;;;***

;;;### (autoloads nil "keys" "keys.el" (0 0 0 0))
;;; Generated autoloads from keys.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "keys" '("cda-open-line" "hydra-" "lispy-insert-prev-outline-body")))

;;;***

;;;### (autoloads nil "modes/cda-avy" "modes/cda-avy.el" (0 0 0 0))
;;; Generated autoloads from modes/cda-avy.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-avy" '("hydra-avy")))

;;;***

;;;### (autoloads nil "modes/cda-company" "modes/cda-company.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from modes/cda-company.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-company" '("cda-")))

;;;***

;;;### (autoloads nil "modes/cda-eaf" "modes/cda-eaf.el" (0 0 0 0))
;;; Generated autoloads from modes/cda-eaf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-eaf" '("hydra-eaf-menu")))

;;;***

;;;### (autoloads nil "modes/cda-elisp" "modes/cda-elisp.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from modes/cda-elisp.el

(autoload 'cda-emacs-lisp-hook "modes/cda-elisp" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-elisp" '("cda-" "conditionally-enable-lispy" "lisp--match-hidden-arg")))

;;;***

;;;### (autoloads nil "modes/cda-flyspell" "modes/cda-flyspell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from modes/cda-flyspell.el

(autoload 'cda-flyspell-previous-word "modes/cda-flyspell" "\
Correct the first misspelled word that occurs before point.
But don't look beyond what's visible on the screen." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-flyspell" '("flyspell-ignore-http-and-https")))

;;;***

;;;### (autoloads nil "modes/cda-ivy" "modes/cda-ivy.el" (0 0 0 0))
;;; Generated autoloads from modes/cda-ivy.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-ivy" '("cda-" "ivy-")))

;;;***

;;;### (autoloads nil "modes/cda-org" "modes/cda-org.el" (0 0 0 0))
;;; Generated autoloads from modes/cda-org.el

(autoload 'cda-org-hook "modes/cda-org" nil nil nil)

(autoload 'cda-org-agenda-hook "modes/cda-org" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-org" '("cda-" "hot-expand" "hydra-org-" "org-")))

;;;***

;;;### (autoloads nil "modes/cda-org-babel" "modes/cda-org-babel.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from modes/cda-org-babel.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-org-babel" '("org-babel-default-header-args:clojure")))

;;;***

;;;### (autoloads nil "modes/cda-projectile" "modes/cda-projectile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from modes/cda-projectile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-projectile" '("hydra-projectile")))

;;;***

;;;### (autoloads nil "modes/cda-python" "modes/cda-python.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from modes/cda-python.el

(autoload 'cda-python-hook "modes/cda-python" nil nil nil)

(autoload 'cda-inferior-python-hook "modes/cda-python" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-python" '("cda-" "python-")))

;;;***

;;;### (autoloads nil "modes/cda-rime" "modes/cda-rime.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from modes/cda-rime.el

(autoload 'cda-rime-hook "modes/cda-rime" nil nil nil)

;;;***

;;;### (autoloads nil "modes/cda-scheme" "modes/cda-scheme.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from modes/cda-scheme.el

(autoload 'cda-scheme-hook "modes/cda-scheme" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cda-scheme" '("scheme-completion-at-point")))

;;;***

;;;### (autoloads nil nil ("hooks.el" "modes/cda-elisp-style-guide.el"
;;;;;;  "modes/cda-sdcv.el") (0 0 0 0))

;;;***

;;;### (autoloads nil "auto" "auto.el" (0 0 0 0))
;;; Generated autoloads from auto.el

(autoload 'cda-para-down "auto" "\


\(fn ARG)" t nil)

(autoload 'cda-para-up "auto" "\


\(fn ARG)" t nil)

(autoload 'cda-move-beginning-of-line "auto" nil t nil)

(autoload 'cda-open-file-at-point "auto" "\


\(fn EVENT)" t nil)

(autoload 'cda-open-wikipedia "auto" nil t nil)

(autoload 'cda-c-forward-sexp-function "auto" "\


\(fn ARG)" nil nil)

(autoload 'cda-project "auto" nil t nil)

(autoload 'cda-occur "auto" "\
Call `occur' with a sane default." t nil)

(autoload 'cda-query-replace-regex "auto" "\


\(fn FROM)" t nil)

(autoload 'cda-query-replace "auto" "\


\(fn FROM)" t nil)

(autoload 'cda-replace-regexp "auto" "\
Works on current line if there's no region.
When ARG is non-nil launch `query-replace-regexp'.

\(fn ARG)" t nil)

(autoload 'og "auto" "\
Search using ag in a given DIRECTORY for a given search STRING,
with STRING defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING DIRECTORY)" t nil)

(autoload 'cda-unfill-paragraph "auto" "\
Transform a paragraph into a single line." t nil)

(autoload 'cda-ctrltab "auto" "\
List buffers and give it focus." t nil)

(autoload 'cda-terminal "auto" "\
Switch to terminal. Launch if nonexistent." t nil)

(autoload 'cda-goto-hook-file "auto" "\
Opens hooks.el at point specific to current `major-mode'" t nil)

(autoload 'cda-dired-rsync "auto" "\


\(fn DEST)" t nil)

(autoload 'cda-describe-keys "auto" nil t nil)

(autoload 'illiterate "auto" "\
Useful to completely revert an `org-mode' file." t nil)

(autoload 'melpa "auto" nil t nil)

(autoload 'cda-test-emacs "auto" nil t nil)

(autoload 'cda-figlet-region "auto" "\


\(fn &optional B E)" t nil)

(autoload 'cda-reinit-semantic "auto" nil t nil)

(autoload 'cda-nw-yank "auto" nil t nil)

(autoload 'cda-install-gcl "auto" nil t nil)

(autoload 'bmk/magit-status "auto" "\
Bookmark for `magit-status'." t nil)

(autoload 'bmk/scratch "auto" "\
Bookmark for *scratch*." t nil)

(autoload 'bmk/function "auto" "\
Handle a function bookmark BOOKMARK.

\(fn BOOKMARK)" nil nil)

(autoload 'cda-ediff-buffers "auto" nil t nil)

(autoload 'cda-org-to-html-to-clipboard "auto" "\
Export region to HTML, and copy it to the clipboard." t nil)

(autoload 'cda-eval-other-window "auto" "\
Eval current expression in the context of other window.
Expression has to be of type (setq X BODY)
In case 'setq isn't present, add it.

\(fn ARG123)" t nil)

(autoload 'cda-describe-hash "auto" "\
Display the full documentation of VARIABLE (a symbol).
Returns the documentation as a string, also.
If VARIABLE has a buffer-local value in BUFFER (default to the current buffer),
it is displayed along with the global value.

\(fn VARIABLE &optional BUFFER)" t nil)

(autoload 'cda-toggle-window-dedicated "auto" nil t nil)

(autoload 'update-all-autoloads "auto" nil t nil)

(autoload 'align-cols "auto" "\
Align text between point and mark as columns.
Columns are separated by whitespace characters.
Prefix arg means align that many columns. (default is all)

\(fn START END MAX-COLS)" t nil)

(autoload 'cda-comment-and-insert "auto" nil t nil)

(autoload 'cda-dired-org-to-pdf "auto" nil t nil)

(autoload 'wmctrl-720p "auto" nil t nil)

(autoload 'cda-kill-current-buffer "auto" nil t nil)

(autoload 'cda-save-and-switch-buffer "auto" "\


\(fn &optional ARG)" t nil)

(autoload 'youtube-dl "auto" nil t nil)

(autoload 'cda-directory-parent "auto" "\
Return parent of directory DIR.

\(fn DIR)" nil nil)

(autoload 'cda-pretty-things "auto" "\
Compose chars according to `cda-pretty-alist'." nil nil)

(autoload 'cda-fontify-glyph "auto" "\


\(fn ITEM GLYPH)" nil nil)

(autoload 'cda-elisp-follow "auto" "\
Jump to the definition of the function (or variable) at point.

\(fn NAME)" t nil)

(autoload 'capitalize-word-toggle "auto" nil t nil)

(autoload 'upcase-word-toggle "auto" nil t nil)

(autoload 'named-term "auto" "\


\(fn NAME)" t nil)

(autoload 'jekyll-serve "auto" nil t nil)

(autoload 'sudired "auto" nil t nil)

(autoload 'cda-insert-date "auto" "\
Insert DATE using the current locale.

\(fn DATE)" t nil)

(autoload 'cda-insert-date-from "auto" "\
Insert date that is DAYS from current.

\(fn &optional DAYS)" t nil)

(autoload 'cda-set-transparency "auto" "\


\(fn ALPHA-LEVEL)" t nil)

(autoload 'cda-hide-ctrl-M "auto" "\
Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings." t nil)

(autoload 'cda-lookup-key "auto" "\


\(fn KEY)" nil nil)

(autoload 'cda-pretty-quote-glyphs "auto" nil nil nil)

(defadvice kill-compilation (after cda-disable-compiling-message activate) (setq compilation-in-progress nil))

(autoload 'cda-custom-setq "auto" "\
Set a custom variable, with completion." t nil)

(autoload 'cda-quote-github-issues "auto" nil t nil)

(autoload 'cda-rename-pdf-bibtex "auto" nil t nil)

(autoload 'cda-start-process "auto" "\


\(fn CMD)" nil nil)

(autoload 'git-shortlog "auto" nil t nil)

(autoload 'cda-recompile-startup "auto" "\
Fix byte-compilation warnings emitted by lread.c." t nil)

(autoload 'cda-firefox-io-idle "auto" "\
Make sure Firefox doesn't use too much IO resulting in audio lag." t nil)

(autoload 'cda-rhythmbox-io-best "auto" nil t nil)

(autoload 'ipinfo "auto" "\
Return ip info from ipinfo.io for IP.

\(fn IP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto" '("cda-" "char-upcasep" "dbg" "re-seq" "show-message")))

;;;***
