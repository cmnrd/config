(use-package evil-magit
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
    (require 'evil-magit))
