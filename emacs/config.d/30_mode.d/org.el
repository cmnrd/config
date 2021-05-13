(use-package orgit
  :ensure t)

(use-package org-bullets
  :ensure t)

;; setup org mode
(use-package org
  :ensure org-plus-contrib
  :config
  (require 'org)
  (require 'ol-notmuch)
  (require 'org-tempo)
  (require 'org-caldav)
  (require 'org-ref)
  (require 'orgit)

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (setq org-default-notes-file "~/org/tasks.org")
  (define-key global-map "\C-cc" 'org-capture)

  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  ;; set the keywords
  ;; '!' is a timestamp
  ;; '@' is a note
  (setq org-todo-keywords
        '((sequence "TODO(t)" "APPT(a)" "BUG(b)" "NOTE(n)" "PROJECT(p)"
                    "WAIT(w@/!)" "|" "DONE(d)" "CANCELED(c@)")))

  ;; set capture templates
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Inbox")
           "* TODO %?\n  LINK: %a\n  ADDED: %U")
          ("b" "Bug" entry (file+headline "~/org/tasks.org" "Inbox")
           "* BUG %?\n  LINK: %a\n  ADDED: %U")
          ("a" "Appointment" entry (file+headline "~/org/calendar/calendar.org" "Captured")
           "* APPT %?\n  WHEN: %^T\n  LINK: %a\n  ADDED: %U")
          ("l" "Log entry in current buffer" entry (file+datetree buffer-file-name)
           "* NOTE %?\n  ADDED: %U")
          ("n" "Note" entry (file+headline "~/org/tasks.org" "Inbox")
           "* NOTE %?\n  LINK: %a\n  ADDED: %U")
          ("p" "Paper" entry (file+headline "~/org/tasks.org" "Papers")
           "* %^{TITLE} :work:papers:\n  ADDED: %U\n\
** TODO Add bibtex entry for \"%\\1\"\n\
** TODO Add PDF for \"%\\1\"\n\
** TODO Read Paper \"%\\1\"\n\
** TODO Add Notes from reading \"%\\1\"\n")))

  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  ;; setup caldav
  :ensure t
  :config
  (setq org-icalendar-timezone "Europe/Berlin"
        org-caldav-url "https://dav.cmenard.me/cal.php/calendars/christian"
        org-caldav-calendar-id "default"
        org-caldav-inbox (expand-file-name "~/org/calendar/inbox.org")
        org-caldav-show-sync-results nil
        org-caldav-delete-org-entries 'always)
  (setq org-caldav-files `("~/org/calendar/calendar.org"
                           "~/org/calendar/archive.org"
                           "~/org/deft/meetings.org"
                           "~/org/deft/teaching.org"))
  ;; sync once at startup
  ;;  (org-caldav-sync))
  ;; agenda files
  (custom-set-variables '(org-agenda-files (quote ("~/org" "~/org/calendar/" "~/org/deft"))))

  ;; also show state changes in the agenda log view
  (setq org-agenda-log-mode-items '(closed state clock))

  ;; for loading citations from CrossRef and others
  (use-package biblio
    :ensure t)

  (setq org-ref-default-bibliography '("~/Documents/Bibliography/bibliography.bib"))
  (setq org-ref-bibliography-notes "~/org/deft/paper-notes.org")
  (setq org-ref-pdf-directory "~/Documents/Bibliography/PDFs/")

  (setq bibtex-completion-notes-template-one-file
        (concat "* ${author} (${year}): ${title}\n"
                "  :PROPERTIES:\n"
                "   :Custom_ID: ${=key=}\n"
                "  :END:\n"
                "  cite:${=key=}\n"))
  (setq org-ref-notes-function
      (lambda (thekey)
        (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
          (bibtex-completion-edit-notes
           (list (car (org-ref-get-bibtex-key-and-file thekey)))))))

  (require 'org-ref)
  (require 'org-ref-pdf)
;  (require 'doi-utils)
  (require 'org-ref-helm-bibtex)
  (require 'org-ref-url-utils)
;  (doi-utils-def-bibtex-type proceedings ("proceedings" "conference")
 ;                            author title booktitle year month pages doi url)
;  (doi-utils-def-bibtex-type inproceedings ("paper-conference" "proceedings-article")
;                             author title booktitle year month pages doi url)
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator ""
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 8)
  (setq bibtex-dialect 'biblatex)
  ;; (setq biblio-cleanup-bibtex-function
  ;;   (lambda (autokey) "call org-ref clean" (org-ref-clean-bibtex-entry)))
  (setq biblio-doi--dx-mime-accept "application/x-bibtex")
  (setq  org-latex-pdf-process
         '("latexmk -shell-escape -bibtex -pdf %f"))

  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t) (plantuml . t) (ditaa . t)))

  (setq org-plantuml-jar-path
        (expand-file-name "/opt/plantuml/plantuml.jar"))
  (setq org-ditaa-jar-path
        (expand-file-name "/usr/share/java/ditaa/ditaa-0.11.jar"))

  ;; export code as listings
    (setq org-latex-listings 'listings))
