(use-package clang-format
  :ensure t
  :config
  (setq clang-format-style "mozilla")
  (global-set-key (kbd "C-c i") 'clang-format-region)
  (global-set-key (kbd "C-c u") 'clang-format-buffer)
  )
