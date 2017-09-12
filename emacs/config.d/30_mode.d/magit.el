(use-package evil-magit
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (require 'evil-magit))

;; switch to insert mode when prompting for the commit message
(add-hook 'git-commit-mode-hook 'evil-insert-state)
