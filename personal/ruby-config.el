;; Ruby
(require 'ruby-mode)
(require 'robe)
(require 'rspec-mode)
(require 'enh-ruby-mode)

(add-to-list 'auto-mode-alist '("\\.irbrc" . ruby-mode))

(setq rspec-autosave-buffer t
      rspec-spec-command "bin/rspec"
      rspec-use-spring-when-possible nil
      rspec-use-bundler-when-possible nil)

(setq ruby-insert-encoding-magic-comment nil
      ruby-deep-indent-paren nil)
(setq enh-ruby-bounce-deep-indent nil
      enh-ruby-deep-indent-construct nil
 enh-ruby-deep-indent-paren nil)



(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(add-hook 'robe-mode-on-hook
          (lambda ()
            (remove-hook 'completion-at-point-functions
                         'robe-complete-at-point t)))

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)
;;                  (remq 'company-capf company-backends))))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)


;;(setq rspec-use-opts-file-when-available nil)

(add-to-list 'auto-mode-alist         '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'robe-mode)
