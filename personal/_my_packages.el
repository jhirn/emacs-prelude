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
        bundler
        company
        company-inf-ruby
        helm-company
        helm-rails
        flymake-easy
        prodigy
        prettier-js
        robe
        rspec-mode
        rbenv
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
