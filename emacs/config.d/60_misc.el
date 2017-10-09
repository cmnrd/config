;;; Don't ask for yes or no. y or n is enough.
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Remember the history
(savehist-mode 1)

;;; scroll to first errror in compilation mode
(setq compilation-scroll-output 'first-error)
