(package-initialize)

;; Load all ".el" files under ~/.emacs.d/config directory.
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/config.d")

;; keep this file clean and store custom variables in another file
(defconst custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" "" custom-file))
(load custom-file)

;; load local.el if it exists
(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local"))
