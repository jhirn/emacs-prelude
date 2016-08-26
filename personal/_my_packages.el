;;package-manager
(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages)
(setq my-packages
      '((org (20140210))
        ac-cider
        ac-js2
        ag
        auto-complete
        bundler
        company-ghc
        company-inf-ruby
        helm-ack
        helm-ag
        helm-company
        helm-gist
        helm-git
        helm-rails
        helm-robe
        pomodoro
        popwin
        powerline
        prodigy
        rbenv
        robe
        rspec-mode
        rubocop
        smex
        sml-mode
        tidy
        twittering-mode
        window-number
        flymake-easy))

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
