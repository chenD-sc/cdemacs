;;* Navigation

;;;###autoload
(defun cda-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

;;;###autoload
(defun update-all-autoloads ()
  (interactive)
  (cd emacs-d)
  (let ((generated-autoload-file
         (expand-file-name "loaddefs.el")))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
        (insert ";;") ;; create the file with non-zero size to appease autoload
        (save-buffer)))
    (mapcar #'update-directory-autoloads
            '("" "modes"))))

;;;###autoload
(defun cda-fontify-glyph (item glyph)
  `((,item
     (0 font-lock-keyword-face t)
     (0 (prog1
            (compose-region (match-beginning 0)
                            (match-end 0)
                            ,glyph) nil)))))