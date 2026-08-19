(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated . t))

(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-display-line-numbers-mode 1)

(setq visible-bell t)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(savehist-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-rose-pine-moon t))

(use-package diredfl
  :ensure t
  :hook
  (dired-mode . diredfl-mode))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(set-face-attribute 'default nil
		    :font "IosevkaTermSlab Nerd Font Mono"
		    :height 220
		    :weight 'bold)

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)))

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("M-y" . consult-yank-pop)
   ("C-c s" . consult-ripgrep))) 

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package magit
  :ensure t)

(use-package ghostel
  :ensure t)

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :ensure t
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x pgtk))
    (exec-path-from-shell-initialize)))

(use-package dune
  :ensure t)

(use-package tuareg
  :ensure t)

(use-package ocaml-eglot
  :ensure t
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot-mode . eglot-ensure))

(use-package ocp-indent
  :ensure t)
