(use-package notmuch
  :ensure t
  :bind ("C-x m" . notmuch)
  :config
  ;; use icons to visualize often used tags
  (setq notmuch-tag-formats `(("unread" (all-the-icons-octicon "mail"))
                              ("inbox" (all-the-icons-octicon "inbox"))
                              ("replied" (all-the-icons-octicon "mail-reply"))
                              ("sent" (all-the-icons-octicon "arrow-up"))
                              ("to-me" (all-the-icons-octicon "person"))
                              ("signed" (all-the-icons-octicon "pencil"))
                              ("work" (all-the-icons-octicon "briefcase"))
                              ("attachment" (all-the-icons-octicon "package"))))

  ;; use remote notmuch
  (setq notmuch-command "/home/cmenard/remote-notmuch.sh")

  ;; helper function to sort tags, this helps to put symbols before other tags
  (defun my-notmuch-tag-sort (tags)
    (setq res nil)
    (setq tail nil)
    (if (member "unread" tags)
        (setq tags (remove "unread" tags)
              res (append res '("unread"))))
    (if (member "inbox" tags)
        (setq tags (remove "inbox" tags)
              res (append res '("inbox"))))
    (if (member "work" tags)
        (setq tags (remove "work" tags)
              res (append res '("work"))))
    (if (member "signed" tags)
        (setq tags (remove "signed" tags)
              res (append res '("signed"))))
    (if (member "attachement" tags)
        (setq tags (remove "attachement" tags)
              res (append res '("attachement"))))
    (if (member "to-me" tags)
        (setq tags (remove "to-me" tags)
              res (append res '("to-me"))))
    (if (member "replied" tags)
        (setq tags (remove "replied" tags)
              tail (append tail '("replied"))))
    (if (member "sent" tags)
        (setq tags (remove "sent" tags)
              tail (append tail '("sent"))))
    (setq res (append res (sort tags #'string<)))
    (append res tail))

  ;; replace this notmuch function to use the sort function define above
  (defun notmuch-tag-format-tags (tags orig-tags &optional face)
    "Return a string representing formatted TAGS."
    (let ((face (or face 'notmuch-tag-face))
          (all-tags (my-notmuch-tag-sort (delete-dups (append tags orig-tags nil)))))
      (notmuch-apply-face
       (mapconcat #'identity
                  ;; nil indicated that the tag was deliberately hidden
                  (delq nil (mapcar
                             (apply-partially #'notmuch-tag-format-tag tags orig-tags)
                             all-tags))
                  " ")
       face
       t)))

    (setq notmuch-search-oldest-first nil)
    (setq message-send-mail-function 'message-send-mail-with-sendmail)
    (setq sendmail-program "/usr/local/bin/msmtp-enqueue.sh")
    (setq mail-specify-envelope-from t)
    (setq message-sendmail-envelope-from 'header)
    (setq mail-envelope-from 'header)
    (define-key notmuch-show-mode-map "d"
      (lambda ()
        "toggle deleted tag for thread"
        (interactive)
        (if (member "deleted" (notmuch-show-get-tags))
            (notmuch-show-tag (list "-deleted"))
          (notmuch-show-tag (list "+deleted")))))
    (define-key notmuch-search-mode-map "d"
      (lambda ()
        "toggle deleted tag for thread"
        (interactive)
        (if (member "deleted" (notmuch-search-get-tags))
            (notmuch-search-tag (list "-deleted"))
          (notmuch-search-tag (list "+deleted")))))
    (define-key notmuch-show-mode-map "S"
      (lambda ()
        "mark message as spam"
        (interactive)
        (notmuch-show-tag (list "+spam" "-inbox"))))

    (define-key notmuch-search-mode-map "S"
      (lambda ()
        "mark thread as spam"
        (interactive)
        (notmuch-search-tag (list "+spam" "-inbox"))))
    (define-key notmuch-show-mode-map "u"
      (lambda ()
        "toggle unread tag for message"
        (interactive)
        (if (member "unread" (notmuch-show-get-tags))
            (notmuch-show-tag (list "-unread"))
          (notmuch-show-tag (list "+unread")))))
    (define-key notmuch-search-mode-map "u"
      (lambda ()
        "toggle unread tag for message"
        (interactive)
        (if (member "unread" (notmuch-search-get-tags))
            (notmuch-search-tag (list "-unread"))
          (notmuch-search-tag (list "+unread")))))
    (define-key notmuch-search-mode-map "g"
      'notmuch-poll-and-refresh-this-buffer)
    (define-key notmuch-hello-mode-map "g"
      'notmuch-poll-and-refresh-this-buffer))
