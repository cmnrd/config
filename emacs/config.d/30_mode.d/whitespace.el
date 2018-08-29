;; Highlight trailing whitespaces and too long lines
(setq-default fill-column 79)
(require 'whitespace)
(setq whitespace-style (quote (face trailing lines-tail)))
(add-hook 'text-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; (use-package char-font-lock
;;   :ensure t)
