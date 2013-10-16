(require 'smartparens)


(setq
 sp-highlight-wrap-overlay nil
 sp-autoescape-string-quote nil
 sp-autoskip-closing-pair 'always
 blink-matching-paren t)

(show-smartparens-global-mode t)

(custom-set-faces
 '(sp-pair-overlay-face ((t (:background "grey20")))))


;;sp-highlight-pair-overlay nil
;;sp-highlight-wrap-tag-overlay nil
