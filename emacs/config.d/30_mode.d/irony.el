;; (use-package irony
;;   :ensure t
;;   :config
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   (add-hook 'c++-mode-hook 'company-mode)
;;   (add-hook 'c-mode-hook 'company-mode)
;;   (add-hook 'objc-mode-hook 'company-mode)
;;   (add-hook 'c++-mode-hook 'flycheck-mode)
;;   (add-hook 'c-mode-hook 'flycheck-mode)
;;   (add-hook 'objc-mode-hook 'flycheck-mode)

;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; (use-package company-irony
;;   :ensure t
;;   :config
;;   '(add-to-list
;;     'company-backends '(company-irony)))

;; (use-package company-irony-c-headers
;;   :ensure t
;;   :config
;;   (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends '(company-irony-c-headers company-irony))))

;; (use-package flycheck-irony
;;   :ensure t
;;   :config
;;   (eval-after-load 'flycheck
;;     '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
