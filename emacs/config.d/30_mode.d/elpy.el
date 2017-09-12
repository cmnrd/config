(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-enable))
