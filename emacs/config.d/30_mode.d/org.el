(use-package orgit
  :ensure t)

(use-package org-bullets
  :ensure t)

;; setup org mode
(use-package org
  :ensure org-plus-contrib
  :config
  (require 'org)
  (require 'org-notmuch)
  (require 'orgit))

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
      '(("t" "Todo" entry (file+headline ,org-default-notes-file "Inbox")
         "* TODO %?\n  LINK: %a\n  ADDED: %U")
        ("b" "Bug" entry (file+headline ,org-default-notes-file "Inbox")
         "* BUG %?\n  LINK: %a\n  ADDED: %U")
        ("a" "Appointment" entry (file+headline "~/org/calendar/inbox.org" "Inbox")
         "* APPT %?\n  WHEN: %^T\n  LINK: %a\n  ADDED: %U")
        ("l" "Log entry in current buffer" entry (file+datetree buffer-file-name)
         "* NOTE %?\n  ADDED: %U")
        ("n" "Note" entry (file+headline ,org-default-notes-file "Inbox")
         "* NOTE %?\n  LINK: %a\n  ADDED: %U")))

(add-hook 'org-capture-mode-hook 'evil-insert-state)

;; agenda files
(setq org-agenda-files '("~/org"))

;; setup caldav
(use-package org-caldav
  :ensure t
  :config
  (setq org-icalendar-timezone "Europe/Berlin"
        org-caldav-url "https://dav.cmenard.me/cal.php/calendars/christian"
        org-caldav-calendar-id "default"
        org-caldav-inbox (expand-file-name "~/org/calendar/inbox.org")
        org-caldav-show-sync-results nil
        org-caldav-delete-org-entries 'always)
  (setq org-caldav-files `("~/org/calendar/calendar.org"
                           "~/org/calendar/archive.org"))
  ;; sync once at startup
  (org-caldav-sync))
