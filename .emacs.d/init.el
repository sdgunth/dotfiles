; Use MELPA
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Setup Flycheck
(package-install 'flycheck)
(require 'flycheck)
(global-flycheck-mode)

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
