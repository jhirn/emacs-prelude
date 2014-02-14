;;package-manager
(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages '(sml-mode
                      auto-complete
                      ac-nrepl
                      ac-js2
                      rspec-mode
                      powerline
                      smex
                      twittering-mode
                      pomodoro
                      tidy
                      bundler
                      rbenv
                      window-number
                      popwin
                      (org (20140210))))

(defun install-package (package min-version)
  (unless (package-installed-p package min-version)
    (package-install package)))

(defun install-my-packages ()
  (dolist (p my-packages)
    (if (listp p)
        (let ((pkg (car p))
              (min-version (cadr p)))
          (install-package pkg min-version))
      (install-package p nil))))

(install-my-packages)
;;end package management
