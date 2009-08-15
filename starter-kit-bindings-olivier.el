(fset 'macro-comment-line
   [?\C-a ?\C-  ?\C-e escape ?x ?c ?o ?m ?m ?e ?n ?t ?- ?r ?e ?g ?i ?o ?n return ?\C-a down])

(global-set-key [f1] 'macro-comment-line)
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'apply-macro-to-region-lines)
(global-set-key [f4] 'call-last-kbd-macro)
(global-set-key [f5] 'insert-fold-start-header)
(global-set-key [f6] 'insert-fold-end-header)
(global-set-key [f7] `calculator)
(global-set-key [f9] 'menu-bar-mode)
(global-set-key [f10] 'magit-status)
(global-set-key [f11] 'svn-status)
(global-set-key [f12] 'indent-region)

(fset 'move-down-current-line
   [?\C-  down ?\C-w down ?\C-y up])

(fset 'move-up-current-line
   [?\C-  down ?\C-w up ?\C-y up])


(global-set-key [\S-up] 'move-up-current-line)
(global-set-key [\S-down] 'move-down-current-line)

(global-set-key "\M-i" 'beginning-of-defun)
(global-set-key "\M-p" 'end-of-defun)

(global-set-key "\C-p" 'goto-line)
(global-set-key "\C-o" 'other-window)

; *** Key binding : M-$ : aspell word
(global-set-key (read-kbd-macro "M-$") 'ispell-word)

; ----------------------------------------------------------
; restore unwanted key binding from starter-kit
; ----------------------------------------------------------
(global-set-key (kbd "C-x h") 'mark-whole-buffer) ;(global-set-key (kbd "C-x h") 'view-url)

(provide 'starter-kit-bindings-olivier)
