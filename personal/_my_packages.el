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
        fish-mode
        graphql-mode
        helm-ag
        helm-company
        helm-rails
        multiple-cursors
        rainbow-delimiters
        rainbow-mode
        rjsx-mode
        robe
        rspec-mode
        rubocop
        terraform-mode
        window-number))


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
