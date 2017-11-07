;; use helm-mod
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1))

(use-package helm-fuzzy-find
  :ensure t)

(use-package helm-bibtex
  :ensure t
  :config
  (setq bibtex-completion-bibliography '("~/bib/bibliography.bib"))
  (setq bibtex-completion-library-path '("~/bib/pdfs"))
  (setq bibtex-completion-pdf-field "File")
  (setq bibtex-completion-notes-path "~/bib/notes.org"))
