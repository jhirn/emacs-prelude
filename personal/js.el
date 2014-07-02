(require 'js2-mode)

(setq js-indent-level 2) ;nerd rage I must set this separate from 'default-tab-width

(eval-after-load 'js
  (font-lock-add-keywords
   'js-mode `(("\\(function *\\)[(|[[:space:]]]?"
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1) "\u0192")
                         nil)))
              ("[[:space:]]\\(var\\)[[:space:]]"
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1) "\u028B ")
                         nil)))
              ("[[:space:]]\\(return\\)[[:space:]]"
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1) "\u1D3F ")
                         nil)))
              ("\\(this\\)"
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1) "\u0288")
                         nil))))))
