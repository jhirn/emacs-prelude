;; Ruby
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


(require 'rspec-mode)
(setenv "ALL_TESTS" "true")
(define-key rspec-mode-verifible-keymap (kbd "s") 'rspec-verify-single)
(setq rspec-spec-command "rspec" rspec-use-rake-flag nil) ;rspec2

;;defined here to deal with possible regression in 24.3.50
(defun rspec-compile (a-file-or-dir &optional opts)
  "Runs a compile for the specified file or diretory with the specified opts"
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "r") (eval `(lambda () (interactive)
                                       (rspec-from-directory ,default-directory
                                                             (rspec-compile ,a-file-or-dir (quote ,opts))))))
    (global-set-key rspec-key-command-prefix map))

  (if rspec-use-rvm
      (rvm-activate-corresponding-ruby))
  (rspec-from-project-root
   (let ((compilation-scroll-output t))
     (compile (mapconcat 'identity `(,(rspec-runner)
                                     ,(rspec-runner-options opts)
                                     ,a-file-or-dir) " ")
              'rspec-compilation-mode))))
