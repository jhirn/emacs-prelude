(require 'company)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-show-numbers t)
(setq company-tooltip-limit 30)

(add-hook 'inf-ruby-mode-hook (lambda () (company-mode 0)))
