(require 'helm)
(require 'helm-config)
(require 'helm-command)
(require 'helm-buffers)


(setq helm-M-x-fuzzy-match        t
      helm-projectile-fuzzy-match nil)

(require 'helm-projectile)
(helm-projectile-on)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.4)))
