(require 'js2-mode)

(setq js2-basic-offset 2);nerd rage I must set this separate from 'default-tab-width

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(defvar keywords `(("\\(function *\\)[(|[[:space:]]]?"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u0192")
                              nil)))
                   ("[[:space:]]\\(var\\)[[:space:]]"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u028b ")
                              nil)))
                   ("[[:space:]]\\(return\\)[[:space:]]"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u1d3f ")
                              nil)))
                   ("\\(this\\)"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u0288")
                              nil)))))
(eval-after-load 'js
  (font-lock-add-keywords
   'js-mode keywords))

(eval-after-load 'js
  (font-lock-add-keywords
   'js2-mode keywords))
