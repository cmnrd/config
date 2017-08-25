;; setup org mode
(use-package org
  :ensure org-plus-contrib
  :config
  (require 'org)
  (require 'org-notmuch))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-default-notes-file "~/tasks.org")
(define-key global-map "\C-cc" 'org-capture)
