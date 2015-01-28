(require 'helm)
(require 'helm-config)
(require 'helm-command)
(require 'helm-buffers)


(setq helm-M-x-fuzzy-match        t
      helm-projectile-fuzzy-match nil)

(require 'helm-projectile)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
