;;package-manager
(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages)
(setq my-packages
      '(ag
        bundler
        company
        company-inf-ruby
        enh-ruby-mode
        eslintd-fix
        helm-company
        helm-rails
        helm-ag
        fish-mode
        rjsx-mode
        robe
        rspec-mode
        rubocop
        window-number
        multiple-cursors))

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
