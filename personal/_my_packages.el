;;package-manager
(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages)
(setq my-packages '(flymake-easy
                    sml-mode
                    auto-complete
                    ac-cider
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
                    (org (20140210))
                    js3-mode
                    company-inf-ruby
                    company-ghc
                    ag
                    helm-ag
                    helm-rails
                    helm-robe
                    helm-git
                    helm-gist
                    helm-company
                    helm-ack
                    robe
                    rubocop
                    prodigy))

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
