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

(setq org-default-notes-file "~/tasks.org")
(define-key global-map "\C-cc" 'org-capture)

(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; set the keywords
;; '!' is a timestamp
;; '@' is a note
(setq org-todo-keywords
      '((sequence "TODO(t)" "APPT(a)" "BUG(b)" "NOTE(n)" "PROJECT(p)" "|" "DONE(d)"
                  "CANCELED(c@)")))

;; set capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/tasks.org" "Inbox")
         "* TODO %?\n  LINK: %a\n  ADDED: %U")
        ("b" "Bug" entry (file+headline "~/tasks.org" "Inbox")
         "* BUG %?\n  LINK: %a\n  ADDED: %U")
        ("a" "Appointment" entry (file+headline "~/tasks.org" "Calendar")
         "* APPT %?\n  WHEN: %^T\n  LINK: %a\n  ADDED: %U")
        ("n" "Note" entry (file+headline "~/tasks.org" "Inbox")
         "* NOTE %?\n  LINK: %a\n  ADDED: %U")))

(add-hook 'org-capture-mode-hook 'evil-insert-state)

;; agenda files
(setq org-agenda-files '("~/tasks.org" "~/deft"))
