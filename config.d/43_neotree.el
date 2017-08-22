;;; all the icons is required for neotree.
;;; Install fonts with M-x all-the-icons-install-fonts.
(use-package all-the-icons
  :ensure t)

;;; Enable neotree and map to F1.
(use-package neotree
  :ensure t
  :config (setq neo-window-width 40))

(define-key global-map (kbd "<f1>") 'neotree-toggle)

;;; Make it work with evil
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

;;; use icons if in graphical mode
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;; close on enter
;; XXX This does not work...
;; (add-hook 'neo-enter-hook
;;           (lambda (type) (if (equal type 'file)
;;                           (neotree-hide))))
