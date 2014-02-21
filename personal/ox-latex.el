(require 'ox-latex)

(rassq-delete-all 'org package--builtins)

(setq org-latex-hyperref-template
      "\\hypersetup{\n  pdfkeywords={%k},\n  pdfsubject={%d},\n  pdfcreator={%c},\n  colorlinks=true,\n  linkcolor=black,\n  urlcolor=blue}\n")
