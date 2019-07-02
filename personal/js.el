(require 'js2-mode)
(require 'eslintd-fix)
(require 'flycheck)

(setq js2-basic-offset 2
      js2-bounce-indent-p t
      js2-strict-missing-semi-warning nil
      flycheck-javascript-eslint-executable "eslint_d")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("components\\/.*\\.js[x]?\\'" . rjsx-mode))


(add-hook 'js2-mode-hook 'eslintd-fix-mode)
(add-hook 'rjsx-mode-hook 'eslintd-fix-mode)

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

(add-hook 'js2-mode-hook
          (lambda ()
            (font-lock-add-keywords nil js-fontlock-keywords)))
