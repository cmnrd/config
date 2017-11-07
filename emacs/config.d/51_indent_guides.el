;; (use-package highlight-indent-guides
;;   :ensure t
;;   :config
;;   (setq highlight-indent-guides-method 'character)
;;   (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
;;   (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
(setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
