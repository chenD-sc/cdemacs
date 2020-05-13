;;* Navigation

;;;###autoload
(defun ora-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

;;;###autoload
(defun update-all-autoloads ()
  (interactive)
  (cd emacs-d)
  (let ((generated-autoload-file
         (expand-file-name "config/loaddefs.el")))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
        (insert ";;") ;; create the file with non-zero size to appease autoload
        (save-buffer)))
    (mapcar #'update-directory-autoloads
            '("" "config/modes" "config"))))


