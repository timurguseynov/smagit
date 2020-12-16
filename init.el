(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq use-package-always-ensure t
      byte-compile-warnings nil
      inhibit-splash-screen t
      make-backup-files nil)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

(use-package magit
  :ensure t
  :config
  (setq magit-diff-refine-hunk t)
  (add-hook 'with-editor-mode-hook 'flyspell-mode)
  (magit-auto-revert-mode -1)
  (magit-status)
  (delete-other-windows))

(global-set-key (kbd "s-g") 'magit-status)

(use-package fullframe
  :config
  (fullframe magit-status magit-mode-bury-buffer nil)
  (fullframe magit-stash-show magit-mode-bury-buffer nil)
  (fullframe magit-show-commit magit-mode-bury-buffer nil))

(use-package counsel
  :defer 1
  :bind (("s-t" . counsel-git)
         ("s-/" . counsel-git-grep))
  :config
  (ivy-mode 1))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

(use-package org
  :config
  (add-hook 'org-mode-hook 'org-indent-mode))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

(load-theme 'spacemacs-light t)
(toggle-frame-maximized)

(defun maybe-magit-refresh ()
  (interactive)
  (when (eq major-mode 'magit-status-mode)
    (magit-refresh)))

(add-hook 'focus-in-hook 'maybe-magit-refresh)

(let ((personal-settings "~/.smagit.el"))
  (when (file-exists-p personal-settings)
    (message "Loading personal settings...")
    (load-file personal-settings)))
