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
