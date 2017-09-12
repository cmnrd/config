(use-package flyspell
  :ensure t
  :config
  (require 'flyspell))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
