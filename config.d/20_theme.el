;; disable welcome screen
(setq inhibit-startup-screen t)

;; set font
(set-frame-font "Source Code Pro Medium-11" nil t)

;; use monokai theme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))
