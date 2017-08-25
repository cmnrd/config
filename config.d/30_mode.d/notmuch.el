(use-package notmuch
  :ensure t
  :config
  (require 'notmuch))

(setq notmuch-search-oldest-first nil)

(define-key notmuch-show-mode-map "d"
  (lambda ()
    "toggle deleted tag for message"
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
  'notmuch-poll-and-refresh-this-buffer)
