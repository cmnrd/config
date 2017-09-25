(defun colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(use-package ansi-color
  :ensure t
  :config
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-hook 'compilation-filter-hook 'colorize-compilation)
  (add-to-list 'comint-output-filter-functions 'ansi-color-process-output))
