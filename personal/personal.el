;;Apple, think different
(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil)

;;Some functions
(defun switch-to-previous-buffer ()
  "toggle between this and previous buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(defun set-font-mba ()
  (interactive)
  (set-font-size 113))

(defun set-font-pairing-station ()
  (interactive)
  (set-font-size 160))

(defun set-font-size (font-height)
  (custom-set-faces `(default ((t (:height ,font-height :family "Monaco"))))))

(defun set-transparancy (transparancy-level)
  (set-frame-parameter (selected-frame) 'alpha transparancy-level))

(defun toggle-transparency ()
  (interactive)
  (if (/=
       (or (cadr (frame-parameter nil 'alpha)) 100)
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(81 70))))

(powerline-default-theme)                                     ;Look and feel
(global-rainbow-delimiters-mode t)
(setq custom-theme-directory (concat prelude-personal-dir "/themes"))
(if window-system
    (progn
        (load-theme 'neopolitan t)
        (set-transparancy '(87 76))
        (add-to-list 'default-frame-alist '(width . 100))
        (add-to-list 'default-frame-alist '(height . 55))
        (menu-bar-mode 1)))

(scroll-bar-mode -1)
(set-fringe-mode 0)
(global-linum-mode 1)
(global-hl-line-mode -1)
(setq linum-format " %d ")
(blink-cursor-mode t)
(set-default 'cursor-type 'bar)
(global-visual-line-mode t)
;;More sets
(setq prelude-whitespace nil)
(setq ispell-dictionary "en")
(setq default-tab-width 2)
(setq js-indent-level 2) ;nerd rage I must set this separate from 'default-tab-width
(setq-default show-trailing-whitespace nil)

(setq vc-suppress-confirm t)
(setq vc-follow-symlinks t)
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(setq scss-compile-at-save nil)
(setq css-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.jst" . html-mode))
;; Captain hooks
(add-hook 'before-save-hook 'whitespace-cleanup nil t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'scss-mode (lambda () (rainbow-mode)))


(add-hook 'clojure-mode-hook          (lambda () (paredit-mode t)))
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode t)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode t)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode t)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode t)))

;;Smexy
(smex-initialize)
(smex-auto-update 30)
(setq smex-show-unbound-commands t)



(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-\\") 'switch-to-previous-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c C-t") 'toggle-transparency)

;(setq yas/trigger-key "C-c .")

(setq markdown-css-path (concat prelude-dir "personal/Github.css"))
(setq ring-bell-function (lambda () (message "*beep*")))
(setq explicit-bash-args '("--noediting" "--login" "-i"))
(setq prelude-guru nil)
