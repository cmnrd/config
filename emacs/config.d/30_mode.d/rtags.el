(use-package rtags
  :ensure t
  :config
  (require 'company)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'objc-mode-hook 'company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  (require 'flycheck-rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil)
  (add-hook 'c-mode-hook #'flycheck-mode)
  (add-hook 'c++-mode-hook #'flycheck-mode)
  (add-hook 'objc-mode-hook #'flycheck-mode))
