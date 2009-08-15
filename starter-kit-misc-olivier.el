(require 'color-theme)
;(color-theme-clarity)
;(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.phtml$" . nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; Chmod +x of #! scripts
;;; 1999-07-12 Noah Friedman <friedman@splode.com>
(defun make-buffer-file-executable-if-script-p ()
  "Make file executable according to umask if not already executable.
If file already has any execute bits set at all, do not change existing
file modes."
  (and (save-excursion
         (save-restriction
           (widen)
           (goto-char (point-min))
           (save-match-data
             (looking-at "^#!"))))
       (let* ((current-mode (file-modes (buffer-file-name)))
              (add-mode (logand ?\111 (default-file-modes))))
         (or (/= (logand ?\111 current-mode) 0)
             (zerop add-mode)
             (set-file-modes (buffer-file-name)
                             (logior current-mode add-mode))))))

(add-hook 'after-save-hook 'make-buffer-file-executable-if-script-p)

(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-active t)

(setq line-number-mode t)
(setq column-number-mode t)

(setq kill-whole-line t)
(setq mouse-yank-at-point t)

(provide 'starter-kit-misc-olivier)
