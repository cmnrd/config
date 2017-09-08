;; disable welcome screen
(setq inhibit-startup-screen t)

;; set font
(set-frame-font "Office Code Pro-11" nil t)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t)
  (zenburn-with-color-variables

    ;; for some modes some adaptions are required...

    ;; magit
    (eval-after-load 'magit
      `(progn
      (set-face-background 'magit-diff-added ,zenburn-bg)
      (set-face-background 'magit-diff-added-highlight ,zenburn-bg+05)
      (set-face-background 'magit-diff-removed ,zenburn-bg)
      (set-face-background 'magit-diff-removed-highlight ,zenburn-bg+05)))

    ;; org
    (eval-after-load 'org
      `(setq org-todo-keyword-faces
             '(("TODO"      . (:foreground ,zenburn-red+1   :weight bold))
               ("DONE"      . (:foreground ,zenburn-green-1 :weight bold))
               ("NOTE"      . (:foreground ,zenburn-blue    :weight bold))
               ("BUG"       . (:foreground ,zenburn-magenta :weight bold))
               ("CANCELLED" . (:foreground ,zenburn-fg-1    :weight bold))
               ("PROJECT"   . (:foreground ,zenburn-blue-2  :weight bold))
               ("WAIT"      . (:foreground ,zenburn-orange  :weight bold))
               ("APPT"      . (:foreground ,zenburn-yellow  :weight bold)))))

    ;; notmuch
    (eval-after-load 'notmuch
      `(progn
         (set-face-foreground 'notmuch-tag-unread ,zenburn-red)
         (set-face-underline 'notmuch-tag-added ,zenburn-green)
         (set-face-attribute 'notmuch-tag-deleted nil :strike-through ,zenburn-red)
         (set-face-foreground 'notmuch-search-date ,zenburn-yellow)
         (set-face-foreground 'notmuch-search-count ,zenburn-cyan)
         (set-face-foreground 'notmuch-search-subject ,zenburn-fg)
         (set-face-foreground 'notmuch-search-matching-authors "#ffeece") ; zenburn-yellow+1
         (set-face-foreground 'notmuch-search-non-matching-authors "#b09f6f") ; zenburn-yellow-4
         (set-face-attribute  'notmuch-tag-face nil :foreground ,zenburn-green+2 :slant 'italic)

         (dolist (face '(notmuch-crypto-signature-good notmuch-crypto-signature-good-key
                                                       notmuch-crypto-signature-unknown notmuch-crypto-signature-bad
                                                       notmuch-crypto-decryption notmuch-crypto-part-header))
           (set-face-attribute face nil :bold t :background ,zenburn-bg-1))

         (set-face-foreground 'notmuch-crypto-signature-good ,zenburn-green+3)
         (set-face-foreground 'notmuch-crypto-signature-good-key ,zenburn-cyan)
         (set-face-foreground 'notmuch-crypto-signature-bad ,zenburn-red+1)
         (set-face-foreground 'notmuch-crypto-signature-unknown "#bf8f6f") ; zenburn-orange-2
         (set-face-foreground 'notmuch-crypto-decryption ,zenburn-magenta)
         (set-face-foreground 'notmuch-crypto-part-header ,zenburn-blue-2)))))
