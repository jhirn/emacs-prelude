;; Ruby
(require 'ruby-mode)
(require 'robe)
(require 'rspec-mode)


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

(setq ruby-insert-encoding-magic-comment nil)


(setq rspec-autosave-buffer t)
(setq rspec-spec-command "bin/rspec")
(setq rspec-use-spring-when-possible nil)
(setq rspec-use-bundler-when-possible nil)
;;(setq rspec-use-opts-file-when-available nil)
