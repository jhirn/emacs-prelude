;(add-to-list 'load-path (concat dotfiles-dir "vendor/auto-complete"))
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

;(ac-flyspell-workaround)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")

(global-auto-complete-mode t)
(setq ac-auto-show-menu 0.4)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 0)
(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-yasnippet
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-symbols
               ac-source-functions
               ac-source-abbrev
               ac-source-words-in-all-buffer))


(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode scss-mode))
  (add-to-list 'ac-modes mode))


;;Key triggers
(ac-set-trigger-key "TAB")
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" 'ac-complete)
