;; Workaround for ox-latex not respecting customization of \hypersetup

(require 'ox-latex)

(defcustom org-export-latex-hyperref-options-format
  "\\hypersetup{\n  pdfkeywords={%s},\n  pdfsubject={%s},\n  pdfcreator={Emacs Org-mode version %s}}\n"
  "A format string for hyperref options.
When non-nil, it must contain three %s format specifications
which will respectively be replaced by the document's keywords,
its description and the Org's version number, as a string.  Set
this option to the empty string if you don't want to include
hyperref options altogether."
  :type 'string
  :group 'org-export-latex)


(defun org-latex-template (contents info)
  "Return complete document string after LaTeX conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (let ((title (org-export-data (plist-get info :title) info)))
    (concat
     ;; Time-stamp.
     (and (plist-get info :time-stamp-file)
	  (format-time-string "%% Created %Y-%m-%d %a %H:%M\n"))
     ;; Document class and packages.
     (let* ((class (plist-get info :latex-class))
	    (class-options (plist-get info :latex-class-options))
	    (header (nth 1 (assoc class org-latex-classes)))
	    (document-class-string
	     (and (stringp header)
		  (if (not class-options) header
		    (replace-regexp-in-string
		     "^[ \t]*\\\\documentclass\\(\\(\\[[^]]*\\]\\)?\\)"
		     class-options header t nil 1)))))
       (if (not document-class-string)
	   (user-error "Unknown LaTeX class `%s'" class)
	 (org-latex-guess-babel-language
	  (org-latex-guess-inputenc
	   (org-element-normalize-string
	    (org-splice-latex-header
	     document-class-string
	     org-latex-default-packages-alist
	     org-latex-packages-alist nil
	     (concat (org-element-normalize-string
		      (plist-get info :latex-header))
		     (plist-get info :latex-header-extra)))))
	  info)))
     ;; Possibly limit depth for headline numbering.
     (let ((sec-num (plist-get info :section-numbers)))
       (when (integerp sec-num)
	 (format "\\setcounter{secnumdepth}{%d}\n" sec-num)))
     ;; Author.
     (let ((author (and (plist-get info :with-author)
			(let ((auth (plist-get info :author)))
			  (and auth (org-export-data auth info)))))
	   (email (and (plist-get info :with-email)
		       (org-export-data (plist-get info :email) info))))
       (cond ((and author email (not (string= "" email)))
	      (format "\\author{%s\\thanks{%s}}\n" author email))
	     ((or author email) (format "\\author{%s}\n" (or author email)))))
     ;; Date.
     (let ((date (and (plist-get info :with-date) (org-export-get-date info))))
       (format "\\date{%s}\n" (org-export-data date info)))
     ;; Title
     (format "\\title{%s}\n" title)
     ;; Hyperref options.
     (when (plist-get info :latex-hyperref-p)
       (format org-export-latex-hyperref-options-format
	       (or (plist-get info :keywords) "")
	       (or (plist-get info :description) "")
	       (if (not (plist-get info :with-creator)) ""
		 (plist-get info :creator))))
     ;; Document start.
     "\\begin{document}\n\n"
     ;; Title command.
     (org-element-normalize-string
      (cond ((string= "" title) nil)
	    ((not (stringp org-latex-title-command)) nil)
	    ((string-match "\\(?:[^%]\\|^\\)%s"
			   org-latex-title-command)
	     (format org-latex-title-command title))
	    (t org-latex-title-command)))
     ;; Table of contents.
     (let ((depth (plist-get info :with-toc)))
       (when depth
	 (concat (when (wholenump depth)
		   (format "\\setcounter{tocdepth}{%d}\n" depth))
		 org-latex-toc-command)))
     ;; Document's body.
     contents
     ;; Creator.
     (let ((creator-info (plist-get info :with-creator)))
       (cond
	((not creator-info) "")
	((eq creator-info 'comment)
	 (format "%% %s\n" (plist-get info :creator)))
	(t (concat (plist-get info :creator) "\n"))))
     ;; Document end.
     "\\end{document}")))
