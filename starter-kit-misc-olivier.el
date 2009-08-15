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

;; (add-hook 'php-mode-hook
;;           '(lambda () ((setq indent-tabs-mode t)))
;;           '(lambda () ((setq setq-default indent-tabs-mode t)))
;;           '(lambda () ((local-set-key (kbd "TAB") 'self-insert-command))))

;; ;; Set the tab width
;; (setq default-tab-width 8)
;; (setq tab-width 8)
;; (setq c-basic-indent 8)


; ---------------------- 
; IS IT DONE BY STARTER KIT ?

;; ;
;; ; .spell
;; ;
;; (setq-default ispell-program-name "aspell")
;; (set-language-environment 'latin-1)
;; (set-input-mode (car (current-input-mode)) (nth 1 (current-input-mode)) 0)
;; (autoload 'ispell-word "ispell" "Check the spelling of word in buffer." 't)
;; (autoload 'ispell-region "ispell" "Check the spelling of region." 't)
;; (autoload 'ispell-buffer "ispell" "Check the spelling of buffer." t)
;; (setq ispell-dictionary "francais"
;;      ispell-skip-sgml t)
;; (autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
;; (setq flyspell-default-dictionary "french")

;; ; highlight region between point and mark
;; (transient-mark-mode t)

;; (setq kill-whole-line t)
;; (setq mouse-yank-at-point t)

; Make all "yes or no" prompts show "y or n" instead
;; (fset 'yes-or-no-p 'y-or-n-p)


; Start with new default.
;; (setq mode-line-format default-mode-line-format)

;; (setq line-number-mode t)
;; (setq column-number-mode t)

(provide 'starter-kit-misc-olivier)
