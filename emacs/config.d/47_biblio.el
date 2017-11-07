;; ;; for loading citations from CrossRef and others
;; (use-package biblio
;;   :ensure t)

;; ;; for viewing and editing bibtex citations
;; (use-package ebib
;;   :ensure t
;;   :config
;;   (setq ebib-preload-bib-files '("~/bib/bibliography.bib"))
;;   (require 'org-ebib))

(use-package org-ref
  :ensure t
  :config

  (setq org-ref-default-bibliography '("~/bib/bibliography.bib"))
  (setq org-ref-bibliography-notes "~/bib/notes.org")
  (setq org-ref-pdf-directory "~/bib/pdfs")
  (require 'org-ref)
  (require 'org-ref-pdf)
  (require 'doi-utils)
  (require 'org-ref-helm-bibtex)
  (require 'org-ref-url-utils)
  (doi-utils-def-bibtex-type proceedings ("proceedings" "conference")
                             author title booktitle year month pages doi url)
  (doi-utils-def-bibtex-type inproceedings ("paper-conference" "proceedings-article")
                             author title booktitle year month pages doi url)
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator ""
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 8)
  (setq biblio-cleanup-bibtex-function
    (lambda (autokey) "call org-ref clean" (org-ref-clean-bibtex-entry)))
  (setq biblio-doi--dx-mime-accept "application/x-bibtex"))
