;;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

(setq use-package-always-ensure t
      inhibit-splash-screen t
      initial-scratch-message ""
      initial-major-mode 'text-mode
      vc-follow-symlinks t
      delete-by-moving-to-trash t
      backup-directory-alist '(("." . "~/Notes/Temp"))
      custom-file (make-temp-file "emacs-custom")
      default-input-method "spanish-prefix"
      eshell-directory-name "~/.emacs.d/eshell/"
      eshell-banner-message "")

(load-theme 'modus-vivendi-tritanopia t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-auto-revert-mode 1)
(global-goto-address-mode 1)
(global-visual-wrap-prefix-mode 1)
(global-hl-line-mode 1)
(auto-save-visited-mode 1)
(delete-selection-mode 1)

(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(defun open-random-file (directory)
  (interactive)
  (let* ((files (directory-files directory t "\\.txt\\'"))
         (random-file (nth (random (length files)) files)))
    (find-file random-file)))

(defun random-note ()
  (interactive)
  (open-random-file "~/Notes/"))

(use-package multiple-cursors
  :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package move-text
  :bind (("M-<up>" . move-text-up)
         ("M-<down>" . move-text-down)
         ("M-p" . move-text-up)
         ("M-n" . move-text-down)))
