; Use MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


; Initialize YCMD
(package-install 'ycmd)
(setq ycmd-package (expand-file-name "~/bin/ycmd/ycmd"))
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python2"))
(add-to-list 'ycmd-server-command ycmd-package t)
(set-variable 'ycmd-extra-conf-whitelist (list))
(add-to-list 'ycmd-extra-conf-whitelist '(expand-file-name "~/Projects"))

; Add company mode to YCMD to insert completions.
(package-install 'company-ycmd)
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook 'global-company-mode)
; Make company mode do completes immediately.
(setq company-idle-delay 0)

; Setup Flycheck
(package-install 'flycheck)
(require 'flycheck)
(global-flycheck-mode)
; Flycheck include paths
(setq flycheck-clang-include-path '("/usr/include"))

; Integrate flycheck and ycmd
(package-install 'flycheck-ycmd)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(setq flycheck-indication-mode nil)

; Setup Go-Mode
(package-install 'go-mode)
(require 'go-mode-autoloads)

; Setup line numbers.
(global-linum-mode t)
(setq column-number-mode t)

; Smart mode line
(package-install 'smart-mode-line)
(setq sml/name-width 20)
(require 'smart-mode-line)
(sml/setup)

; Put backups under a sub directory, to avoid cluttering stuff.
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_backups")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enable evil mode
(package-install 'evil)
(package-install 'undo-tree)
(require 'evil)
(evil-mode 1)

; I am weird, and changing my key bindings.
(add-to-list 'load-path (expand-file-name "~/.emacs.d/sg_custom"))
(require 'pure-evil)
(global-pure-evil-mode 1)

; Turn on solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(setq frame-background-mode 'dark)
(load-theme 'solarized t)

; Make scrolling work more conservatively
(setq mouse-wheel-scroll-amount '(1 ((shift . 1))))
(setq scroll-step 1)

; Show trailing whitespace
(setq show-trailing-whitespace t)

; Make c++ indentation better
;(defun better-cpp-indents()
;  (c-set-offest 'arglist-intro '+))
;(add-hook 'java-mode-hook 'better-cpp-indents)
;(add-hook 'c-mode-hook 'better-cpp-indents)
;(add-hook 'c++-mode-hook 'better-cpp-indents)

; Enable rust-mode
(package-install 'rust-mode)

; Enable markdown mode
(package-install 'markdown-mode)

; File-hooks
; By default, open .h files in c++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
; Use python-mode for bazel files.
(add-to-list 'auto-mode-alist '("'BUILD'" . python-mode))
(add-to-list 'auto-mode-alist '("'WORKSPACE'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . python-mode))
; Enable rust-mode for .rs files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

