;;package-manager
(require 'package)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(sml-mode
                     auto-complete
                     ac-nrepl
;;                     ac-nrepl-compliment
                     ac-js2
;;                     nrepl-ritz
                     rspec-mode
                     powerline
                     smex
                     twittering-mode
                     pomodoro
                     tidy
                     bundler
                     rbenv
                     window-number
                     popwin))

(defun install-my-packages ()
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(install-my-packages)
;;end package management
