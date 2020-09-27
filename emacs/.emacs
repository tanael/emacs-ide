;;; .emacs --- Init file

;;; Commentary:
;; 

(require 'package)
;;; Code:

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; LSP
(use-package lsp-mode
  :hook (
	 (bash-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))

;; Magit
(use-package magit
  :ensure t)

;; smartparens
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode))

;; json-mode
(use-package json-mode
  :ensure t)

;; treemacs
(use-package treemacs
  :ensure t)

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode))

;; doom-emacs themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (doom-themes-visual-bell-config))

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Keys
(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq tab-stop-list (number-sequence 4 120 4))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (doom-material)))
 '(custom-safe-themes
   (quote
    ("9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" default)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (projectile doom-themes smartparens company flycheck which-key lsp-treemacs lsp-ivy lsp-ui use-package ## powerline)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "Inconsolata"))))
 '(cursor ((t (:background "goldenrod")))))

;;; .emacs ends here
