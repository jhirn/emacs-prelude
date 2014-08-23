;;Apple, think different

(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil)

;;Some functions

(defun create-shell ()
  "creates a shell with a given name"
  (interactive);; "Prompt\n shell name:")
  (let ((shell-name (read-string "shell name: " nil)))
    (shell (concat "*" shell-name "*"))))

(defmacro preserving-column (&rest body)
  "Preserve the column of the mark when moving text."
  `(let (c (current-column))
     ,@body
     (move-to-column c)))

(defun transpose-preserving-row (direction)
  "Transpose a column in a given direction keep mark on that line."
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
  (custom-set-faces `(default ((t (:height ,font-height :family "monaco"))))))

(defun set-transparancy (transparancy-level)
  (set-frame-parameter (selected-frame) 'alpha transparancy-level))

(defun toggle-transparency ()
  (interactive)
  (if (/=
       (or (cadr (frame-parameter nil 'alpha)) 100)
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(82 70))))

;;(show-paren-mode nil)


(setq scheme-program-name "petite")

(powerline-default-theme)
(global-rainbow-delimiters-mode t)
(setq custom-theme-directory (concat prelude-personal-dir "/themes"))
(if window-system
    (progn
      (global-unset-key "\C-z")
      (load-theme 'neopolitan t)
      (set-transparancy '(87 76))
                                        ;     (add-to-list 'default-frame-alist '(width . 100))
                                        ;      (add-to-list 'default-frame-alist '(height . 55))
      (menu-bar-mode 1)))
(disable-theme 'zenburn)

(scroll-bar-mode -1)
;;(set-fringe-mode 0)
(require 'linum)
(global-linum-mode 1)
(global-hl-line-mode -1)
(setq linum-format " %d ")
(blink-cursor-mode t)
(set-default 'cursor-type 'bar)
(global-visual-line-mode t)

(require 'prelude-editor)
(setq prelude-guru nil)
(setq prelude-whitespace nil)

(require 'ispell)
(setq ispell-dictionary "en")
(setq tab-width 2)
(setq-default show-trailing-whitespace nil)
(require 'vc)
(setq vc-suppress-confirm t)
(setq vc-follow-symlinks t)



(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setenv "PAGER" (executable-find "cat"))

(add-to-list 'auto-mode-alist '("\\.jst" . html-mode))
;; Captain hooks

;;Smexy
(require 'smex)
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

(setq ring-bell-function (lambda () (message "*beep*")))

(require 'shell)
(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash --login -i"))
(setq auto-mode-alist
      (cons '("\\.bats\'" . sh-mode) auto-mode-alist))

;;(setq comint-process-echoes t)

;;(setq explicit-bash-args '("--noediting" "--login" "-i"))

;;(require 'markdown-mode)
;;(setq markdown-css-path (concat prelude-dir "personal/Github.css"))

(eval-after-load 'flycheck
  '(setq flycheck-checkers
         (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(require 'window-number)
(window-number-meta-mode 1)


(require 'ansi-color)

(add-hook 'compilation-filter-hook
          (lambda ()
            (read-only-mode)
            (ansi-color-apply-on-region (point-min) (point-max))
            (read-only-mode)))


(add-hook 'scss-mode (lambda () (rainbow-mode)))
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook
          (progn
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (not (file-exists-p dir))
                    (make-directory dir t)))))))

;;#omg (yes hashtag #omg)
(autoload 'asp-mode "asp-mode")
(add-to-list 'auto-mode-alist '("\\.asp\\'" . asp-mode))
(add-to-list 'auto-mode-alist '("\\.purs" . haskell-mode))
