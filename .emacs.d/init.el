(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Use MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Initialize YCMD
(defvar ycmd-package)
(setq ycmd-package (expand-file-name "~/bin/ycmd/ycmd"))
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python2"))
(add-to-list 'ycmd-server-command ycmd-package t)
(set-variable 'ycmd-extra-conf-whitelist (list))
(add-to-list 'ycmd-extra-conf-whitelist '(expand-file-name "~/Projects"))

; Add company mode to YCMD to insert completions.
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook 'global-company-mode)
; Make company mode do completes immediately.
(setq company-idle-delay 0)

; Setup Flycheck
(package-install 'flycheck)
(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-clang-language-standard "c++14")
; Flycheck include paths
(setq flycheck-clang-include-path '("/usr/include"))

; Integrate flycheck and ycmd
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(setq flycheck-indication-mode nil)

; Setup Go-Mode
(package-install 'go-mode)
(require 'go-mode-autoloads)

; Setup line numbers.
(require 'relative-line-numbers)
(global-relative-line-numbers-mode)
(setq line-number-mode t)
(setq column-number-mode t)

; Smart mode line
(setq sml/name-width 20)
(require 'smart-mode-line)
(sml/setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enable evil mode
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Turn on dvorak keybinds for evil mode
; (add-to-list 'load-path "~/.emacs.d/evil-dvorak")
; (require 'evil-dvorak)
; (global-evil-dvorak-mode 1)

; Turn on solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(setq frame-background-mode 'dark)
(load-theme 'solarized t)

; Make scrolling work more conservatively
(setq mouse-wheel-scroll-amount '(1 ((shift . 1))))
(setq scroll-step 1)

; File-hooks
; By default, open .h files in c++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
; Use python-mode for bazel files.
(add-to-list 'auto-mode-alist '("'BUILD'" . python-mode))
(add-to-list 'auto-mode-alist '("'WORKSPACE'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . python-mode))

;; Init complete      
