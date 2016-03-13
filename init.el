(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq use-package-always-ensure t
      byte-compile-warnings nil
      inhibit-splash-screen t
      make-backup-files nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Andale Mono Regular-15" nil t)

(defalias 'yes-or-no-p 'y-or-n-p)

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
  (add-hook 'with-editor-mode-hook 'flyspell-mode)
  (magit-status)
  (delete-other-windows))

(use-package counsel
  :ensure t
  :config
  (ivy-mode 1))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

(load-theme 'spacemacs-light t)
(toggle-frame-maximized)
