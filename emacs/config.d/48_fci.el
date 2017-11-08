(use-package fill-column-indicator
  :ensure t
  :config
  ;; workaround for conflict with company mode
  ;; https://github.com/alpaker/Fill-Column-Indicator/issues/54
  (defun on-off-fci-before-company(command)
    (when (string= "show" command)
      (turn-off-fci-mode))
    (when (string= "hide" command)
      (turn-on-fci-mode)))
  (advice-add 'company-call-frontends :before #'on-off-fci-before-company)

  (setq fci-rule-color "#5F5F5F") ; zenburn-bg+2

  (add-hook 'text-mode-hook 'fci-mode)
  (add-hook 'prog-mode-hook 'fci-mode))
