;;; pure-evil --- This file contains the darkest heresy. Certain evil/vim key-bindings
;;; are re-mapped for ease of use for me as a dvorak user.
;;; Commentary:
;;;    This differs from evil-dvorak as only certain keys are re-mapped.


;;; Code:
(require 'evil)
(define-minor-mode pure-evil-mode
  "True evil mode has some minor key rebindings for evil."
  :keymap (make-sparse-keymap))

(defun turn-on-pure-evil-mode()
  "Enable pure evil in this buffer."
  (pure-evil-mode 1))

(defun turn-off-pure-evil-mode()
  "Enable pure evil in this buffer."
  (pure-evil-mode 1))

					; Add a global minor mode.
(define-globalized-minor-mode global-pure-evil-mode
  pure-evil-mode turn-on-pure-evil-mode
  "Global mode to allow pure evil everywhere.")

; Rebindings for normal mode:
(evil-define-key 'normal pure-evil-mode-map
  "s" 'evil-forward-char
  "t" 'evil-next-line
  "n" 'evil-previous-line
  )
(evil-define-key 'motion-state pure-evil-mode-map
  "s" 'evil-forward-char
  "t" 'evil-next-line
  "n" 'evil-previous-line
  )

(evil-define-key 'visual pure-evil-mode-map
  "s" 'evil-forward-char
  "t" 'evil-next-line
  "n" 'evil-previous-line
  )

(provide 'pure-evil)
;;; pure-evil.el ends here
