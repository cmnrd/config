;; switch to evil mode by default
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (evil-set-initial-state 'message-mode 'insert)
  (evil-set-initial-state 'notmuch-message-mode 'insert)
  (setq evil-want-fine-undo t)

  ;; Notmuch
  (evil-define-key 'normal notmuch-search-mode-map
    (kbd "q") 'notmuch-search-quit
    (kbd "n") 'notmuch-search-next-thread
    (kbd "p") 'notmuch-search-previous-thread
    (kbd "RET") 'notmuch-search-show-thread)

  ;; Mail
  (evil-add-hjkl-bindings notmuch-search-mode-map 'emacs)
  (evil-add-hjkl-bindings notmuch-show-mode-map 'emacs)
  (evil-add-hjkl-bindings notmuch-hello-mode-map 'emacs)
  (evil-set-initial-state 'notmuch-search-mode 'emacs)
  (evil-set-initial-state 'notmuch-show-mode 'emacs)
  (evil-set-initial-state 'notmuch-hello-mode 'emacs)
  )
