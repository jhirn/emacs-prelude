(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(ac-flyspell-workaround)

;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")

(global-auto-complete-mode t)
(setq ac-auto-show-menu 1)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 3)

(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-yasnippet
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-symbols
               ac-source-functions
               ac-source-abbrev
               ac-source-words-in-all-buffer))


(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode cider-repl-mode
                                    sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                                    html-mode nxml-mode sh-mode smarty-mode clojure-mode
                                    lisp-mode textile-mode markdown-mode tuareg-mode scss-mode))
  (add-to-list 'ac-modes mode))


(require 'ac-nrepl)

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
