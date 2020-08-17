(require 'helm)
(require 'helm-config)
(require 'helm-command)
(require 'helm-buffers)
(require 'helm-net)

(setq helm-completion-style 'emacs)
(setq completion-styles '(flex))

(require 'helm-projectile)
(helm-projectile-on)

(when (executable-find "curl")
  (setq helm-net-prefer-curl t))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.2)))
