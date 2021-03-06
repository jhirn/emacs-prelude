;;(require 'prelude)
(evil-mode 0)

;;Apple, think different
(setq
 ns-command-modifier   'meta            ; Apple/Command key is Meta
 ns-alternate-modifier 'super           ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil)
;(mac-toggle-tab-bar)

;;Some functions

(defun personal()
  "Open this file"
  (interactive)
  (find-file "~/.emacs.d/personal/personal.el"))

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
  "toggle between current and previous buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))


(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(defun set-font-mba ()
  (interactive)
  (set-font-size 110))

(defun set-font-home ()
  (interactive)
  (set-font-size 125))

(defun set-font-pairing-station ()
  (interactive)
  (set-font-size 140))

(defun set-font-junze ()
  (interactive)
  (set-font-size 140))

(defun set-font-sammy ()
  (interactive)
  (set-font-size 250))

(defun set-font-projector ()
   (interactive)
  (set-font-size 300))

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
    (set-frame-parameter nil 'alpha '(88 82))))

(require 'scheme)
(setq scheme-program-name "petite")

(require 'prelude-custom)

(setq prelude-guru nil
      prelude-whitespace nil)

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
(set-fringe-style '(6 . 0))
(global-display-line-numbers-mode)
(blink-cursor-mode t)
(set-default 'cursor-type '(bar . 2))
(set-cursor-color "white")
(global-visual-line-mode t)

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

;; Captain hooks

;;Smexy
(require 'smex)
(smex-initialize)
(setq smex-show-unbound-commands t)

                                        ;(global-set-key (kbd "M-x") 'smex)

(defun simulate-key-press (key)
  "Pretend that KEY was pressed.
KEY must be given in `kbd' notation."
  `(lambda () (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-c C-p") (simulate-key-press "C-c p"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-f") 'prelude-indent-buffer)
(global-set-key (kbd "C-\\") 'switch-to-previous-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c M-t") 'toggle-transparency)
(global-set-key (kbd "<M-C-up>") 'move-line-up)
(global-set-key (kbd "<M-C-down>") 'move-line-down)
(global-set-key [C-backspace] 'backward-kill-word)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-S-c C-<") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "A-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "A-M-<up>") 'enlarge-window)
(global-set-key (kbd "A-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "A-M-<down>") 'shrink-window)
(global-unset-key [C-tab])
(global-unset-key [wheel-left])
(global-unset-key [wheel-right])

(defun toggle-input-method ())
(setq ring-bell-function (lambda () (message "*beep*")))

(require 'multiple-cursors)
(define-key mc/keymap (kbd "C-;") 'mc-hide-unmatched-lines-mode)

(require 'shell)
(setq explicit-shell-file-name "bash")
(setq shell-file-name "/usr/local/bin/bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash --login -i"))
(setq auto-mode-alist
      (cons '("\\.bats\'" . sh-mode) auto-mode-alist))

(eval-after-load 'flycheck
  '(setq flycheck-checkers
         (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(require 'window-number)
(window-number-meta-mode 1)

(require 'ansi-color)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))


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


(setq magit-auto-revert-mode nil
      magit-last-seen-setup-instructions "1.4.0")
(setq kill-do-not-save-duplicates t)
(setq window-combination-resize t)
(setq confirm-kill-emacs 'y-or-n-p)

(set-font-home)


(setq undo-tree-visualizer-timestamps 't)

(setq coffee-indent-like-python-mode nil
      coffee-tab-width 2)


(setq ido-use-filename-at-point nil)

;; (defun highlight-selected-window ()
;;   "Highlight selected window with a different background color."
;;   (walk-windows (lambda (w)
;;                   (unless (eq w (selected-window))
;;                     (with-current-buffer (window-buffer w)
;;                       (buffer-face-set '(:background "#111"))))))
;;   (buffer-face-set 'default))

;(add-hook 'buffer-list-update-hook 'highlight-selected-window)
