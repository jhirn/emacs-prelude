;;package-manager
(require 'package)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq  my-packages '(auto-complete
                     bitlbee
                     rspec-mode
                     powerline
                     smex
                     twittering-mode
                     pomodoro
                     tidy
                     bundler
                     window-number))

(defun install-my-packages ()
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(install-my-packages)
;;end package management