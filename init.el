(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq use-package-always-ensure t
      byte-compile-warnings nil
      inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Andale Mono Regular-15" nil t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package spacemacs-theme :ensure t)

(use-package magit
  :ensure t
  :config
  (setq magit-diff-refine-hunk t)
  (magit-status)
  (delete-other-windows))

(load-theme 'spacemacs-light t)
(toggle-frame-maximized)
