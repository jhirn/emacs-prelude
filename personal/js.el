(require 'js3-mode)

;(setq js2-basic-offset 2);nerd rage I must set this separate from 'default-tab-width
;(setq js2-bounce-indent-p t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-to-list 'interpreter-mode-alist '("node" . js3-mode))

(defvar js-fontlock-keywords `(("\\(function *\\)[(|[[:space:]]]?"
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
   'js-mode js-fontlock-keywords))

(eval-after-load 'js
  (font-lock-add-keywords
   'js3-mode js-fontlock-keywords))

(require 'json-reformat)
(setq json-reformat:indent-width 2)
