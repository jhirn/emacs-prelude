;; Ruby
(require 'ruby-mode)
(require 'robe)
(require 'rspec-mode)


(defun create-tags-rails (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "cd %s; ctags -a -e -f TAGS --tag-relative -R app lib" dir-name)))


(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

(add-to-list 'auto-mode-alist '("\\.irbrc" . ruby-mode))

(setq ruby-deep-indent-paren nil)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(add-hook 'robe-mode-on-hook
          (lambda ()
            (remove-hook 'completion-at-point-functions
                         'robe-complete-at-point t)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (remq 'company-capf company-backends))))



(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(setq rspec-autosave-buffer t)
(setq rspec-spec-command "bin/rspec")
(setq rspec-use-spring-when-possible nil)
(setq rspec-use-bundler-when-possible nil)
