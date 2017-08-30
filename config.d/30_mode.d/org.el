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
