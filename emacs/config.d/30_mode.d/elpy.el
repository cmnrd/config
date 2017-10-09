(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
  (add-hook 'python-mode-hook 'elpy-enable))

(use-package sphinx-doc
  :ensure t
  :config
  (add-hook 'python-mode-hook (lambda ()
                               (require 'sphinx-doc)
                               (sphinx-doc-mode t))))

(use-package python-docstring
  :ensure t
  :config
  (add-hook 'python-mode-hook 'python-docstring-mode))
