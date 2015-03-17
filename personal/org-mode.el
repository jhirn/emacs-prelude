(require 'org)
(require 'org-mobile)
(require 'ox-latex)

(setq org-export-latex-hyperref-options-format "\\hypersetup{
  pdfkeywords={%s},
  pdfsubject={%s},
  pdfcreator={Emacs Org-mode version %s},
  colorlinks=true,
  linkcolor=black,
  urlcolor=blue}")

(custom-set-faces  '(org-link ((t (:foreground "dark gray")))))
(setq org-export-backends '(ascii html icalendar latex man md))

(setq org-log-done t)
(setq org-directory "~/src/org")
(setq org-agenda-files '("~/src/org"))
(setq org-mobile-inbox-for-pull "~/src/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
