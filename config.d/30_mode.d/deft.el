;;; Load and configure deft. This is mostly copied from:
;;; http://pragmaticemacs.com/category/deft/

;;; helper function to run deft in specified directory
(defun deft-in-dir (dir)
  "Run deft in directory DIR"
  (setq deft-directory dir)
  (switch-to-buffer "*Deft*")
  (kill-this-buffer)
  (deft)
  )

(use-package deft
  :ensure t
  :commands deft
  :init
  (global-set-key (kbd "C-x d")
                  (lambda () (interactive) (deft-in-dir "~/deft")))
  ;; More keybindings to start deft in other directories can be added here
  :config
  (setq deft-extensions '("org"))
  (setq deft-default-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-auto-save-interval 0)

  ;; advise deft to save window config
  (defun bjm-deft-save-windows (orig-fun &rest args)
    (setq bjm-pre-deft-window-config (current-window-configuration))
    (apply orig-fun args)
    )
  (advice-add 'deft :around #'bjm-deft-save-windows)
  ;; function to quit a deft edit cleanly back to pre deft window
  (defun bjm-quit-deft ()
    "Save buffer, kill buffer, kill deft buffer, and restore window config to
the way it was before deft was invoked"
    (interactive)
    (save-buffer)
    (kill-this-buffer)
    (switch-to-buffer "*Deft*")
    (kill-this-buffer)
    (when (window-configuration-p bjm-pre-deft-window-config)
      (set-window-configuration bjm-pre-deft-window-config)
      )
    )

  ;; advise deft-new-file-named to replace spaces in file names with '-'
  (defun bjm-deft-strip-spaces (args)
    "Replace spaces with - in the string contained in the first element of the
list args. Used to advise deft's file naming function."
    (list (replace-regexp-in-string " " "-" (car args)))
    )
  (advice-add 'deft-new-file-named :filter-args #'bjm-deft-strip-spaces)

  (global-set-key (kbd "C-c q") 'bjm-quit-deft)
  )
