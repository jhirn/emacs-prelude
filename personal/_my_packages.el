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
                     rainbow-delimiters
                     pomodoro
                     tidy
                     bundler))

(defun install-my-packages ()
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))


(not  (package-installed-p 'ac-slime))

(install-my-packages)
;;end package management
