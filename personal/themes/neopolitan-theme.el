;;; neopolitan-theme.el --- Dayton Nolan's Neopolitan theme

;; Copyright (C) 2011-2012 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme neopolitan
  "Minor tweaks to the TextMate 'Blackboard' theme.
Used and created by Dayton Nolan.")

(custom-theme-set-faces
 'neopolitan

 '(default ((t (:background "#271F19" :foreground "#FFFFFF"))))

 '(diff-added ((t (:inherit diff-changed :background "#61CE3C"))))
 '(diff-changed ((t (:background "#FBDE2D"))))
 '(diff-indicator-added ((t (:inherit diff-indicator-changed))))
 '(diff-indicator-changed ((t (:weight bold))))
 '(diff-indicator-removed ((t (:inherit diff-indicator-changed))))
 '(diff-removed ((t (:inherit diff-changed :background "#800000"))))

 '(dired-directory ((t (:inherit font-lock-function-name-face :weight bold))))

 '(gnus-button ((t (:inherit button))))
 '(gnus-header-name ((t (:box (:line-width 1 :style released-button) :weight bold))))

 '(header-line ((t (:inherit mode-line :inverse-video t))))

 '(hl-line ((t (:background "#2d2520"))))

 '(message-header-subject ((t (:foreground "SkyBlue"))))

 '(minibuffer-prompt ((t (:background "#271F19" :foreground "#FBDE2D" :box (:line-width -1 :color "#271F19") :weight bold))))

 '(mode-line ((t (:background "#61CE3C" :foreground "#271F19" :box (:style nil) :family "Arial"))))
 '(mode-line-inactive ((t (:inherit mode-line :box nil))))

 '(org-agenda-date ((t (:inherit org-agenda-structure))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :underline t))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "dark green"))))
 '(org-agenda-structure ((t (:foreground "SkyBlue" :weight bold))))
 '(org-hide ((t (:foreground "gray30"))))
 '(org-tag ((t (:weight bold))))

 `(link ((t (:foreground ,"#253B76" :underline t :weight bold))))
 `(link-visited ((t (:foreground ,"#253B76" :underline t :weight normal))))

 `(font-lock-builtin-face ((t (:foreground ,"#D8FA3C"))))
 `(font-lock-comment-face ((t (:foreground ,"#FF0080"))))
 `(font-lock-comment-delimiter-face ((t (:foreground ,"#FF0080"))))
 `(font-lock-constant-face ((t (:foreground ,"#D8FA3C"))))
 `(font-lock-doc-face ((t (:foreground ,"#61CE3C"))))
 `(font-lock-doc-string-face ((t (:foreground ,"#253B76"))))
 `(font-lock-function-name-face ((t (:foreground ,"#FF6400"))))
 `(font-lock-keyword-face ((t (:foreground ,"#FBDE2D" :weight bold))))
 `(font-lock-negation-char-face ((t (:foreground ,"#FFFFFF"))))
 `(font-lock-preprocessor-face ((t (:foreground ,"#FFFFFF"))))
 `(font-lock-string-face ((t (:foreground ,"#61CE3C"))))
 `(font-lock-type-face ((t (:foreground ,"#FF6400"))))
 `(font-lock-variable-name-face ((t (:foreground ,"#FFFFFF"))))
 `(font-lock-warning-face ((t (:foreground ,"#FBDE2D" :weight bold))))

 ;; linum-mode
 `(linum ((t (:foreground ,"#8f8b88" :background ,"#271F19"))))

 ;; rainbow-delimiters
 ;; `(rainbow-delimiters-depth-1-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-2-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-3-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-4-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-5-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-6-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-7-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-8-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-9-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-10-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-11-face ((t (:foreground ,"#FFFFFF"))))
 ;; `(rainbow-delimiters-depth-12-face ((t (:foreground ,"#FFFFFF"))))

 '(region ((t (:background "#253B76"))))

 '(show-paren-match ((t (:background "#271F19"))))
 '(show-paren-mismatch ((t (:background "#800000" :foreground "#FFFFFF"))))

 ;; faces used by isearch
 ; `(isearch ((t (:foreground ,"#61CE3C" :background ,"#271F19"))))
 ; `(isearch-fail ((t (:foreground ,"#FFFFFF" :background ,"#800000"))))
 ; `(lazy-highlight ((t (:foreground ,"#61CE3C" :background ,"#271F19"))))

 '(window-number-face ((t (:foreground "red" :weight bold)))))

(provide-theme 'neopolitan)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; neopolitan-theme.el ends here
