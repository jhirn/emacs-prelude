;;Apple, think different
(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil)

;;Some functions

(defmacro preserving-column (&rest body)
  `(let (c (current-column))
     ,@body
     (move-to-column c)))

(defun transpose-preserving-row (direction)
  (preserving-column
   (forward-line 1)
   (transpose-lines direction)
   (forward-line -1)))

(defun move-line-up ()
  (interactive)
  (transpose-preserving-row -1))

(defun move-line-down ()
  (interactive)
  (transpose-preserving-row 1))

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

(powerline-default-theme)
(global-rainbow-delimiters-mode t)
(setq custom-theme-directory (concat prelude-personal-dir "/themes"))
(if window-system
    (progn
      (global-unset-key "\C-z")
      (load-theme 'neopolitan t)
      (set-transparancy '(87 76))
      (add-to-list 'default-frame-alist '(width . 100))
      (add-to-list 'default-frame-alist '(height . 55))
      (menu-bar-mode 1)))
(disable-theme 'zenburn)

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
(setq tab-width 2)
(setq-default show-trailing-whitespace nil)

(setq vc-suppress-confirm t)
(setq vc-follow-symlinks t)
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.jst" . html-mode))
;; Captain hooks

;;Smexy
(smex-initialize)
(setq smex-show-unbound-commands t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-\\") 'switch-to-previous-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c C-t") 'toggle-transparency)
(global-set-key (kbd "<M-C-up>") 'move-line-up)
(global-set-key (kbd "<M-C-down>") 'move-line-down)
(global-set-key [C-backspace] 'backward-kill-word)

                                        ;(setq yas/trigger-key "C-c .")

(setq markdown-css-path (concat prelude-dir "personal/Github.css"))
(setq ring-bell-function (lambda () (message "*beep*")))
(setq explicit-bash-args '("--noediting" "--login" "-i"))
(setq prelude-guru nil)

(eval-after-load 'flycheck
  '(setq flycheck-checkers
         (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(require 'window-number)
(window-number-meta-mode 1)

(require 'paren)
; Turn off smartparens highlighting
(setq sp-highlight-pair-overlay nil
      sp-highlight-wrap-overlay nil
      sp-highlight-wrap-tag-overlay nil)


(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'scss-mode (lambda () (rainbow-mode)))
(add-hook 'before-save-hook 'whitespace-cleanup nil t)
(add-hook 'before-save-hook
          (progn
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (not (file-exists-p dir))
                    (make-directory dir t)))))))
