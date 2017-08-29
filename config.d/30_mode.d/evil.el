;; switch to evil mode by default
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (evil-set-initial-state 'message-mode 'insert)
  (evil-set-initial-state 'notmuch-message-mode 'insert)
  (setq evil-want-fine-undo t))
