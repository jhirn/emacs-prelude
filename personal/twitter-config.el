(require 'twittering-mode)

(defun lib-notify-new-tweet
  (let ((n twittering-new-tweets-count))
    (start-process "twittering-notify" nil "notify-send"
                   "-i" "/usr/share/emacs/24.1.50/etc/images/icons/hicolor/scalable/apps/emacs.svg"
                   "New tweets"
                   (format "You have %d new tweet%s"
                           n (if (> n 1) "s" "")))))

;;(add-hook 'twittering-new-tweets-hook 'lib-notify-new-tweet)(setq twittering-use-master-password t)

(setq twittering-icon-mode 1)
(setq twittering-timer-interval 90)
(setq twittering-use-master-password t)
