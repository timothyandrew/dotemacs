(nel:require-packages 'guru-mode 'helm 'god-mode 'sublimity)

(nel:run-after-initializing
 ;; Fonts and Formatting
 (setq default-frame-alist '((font . "Source Code Pro-14")))
 (setq-default line-spacing 3)

 ;; Add company mode (autocomplete) everywhere.
 (add-hook 'after-init-hook 'global-company-mode)
 (eval-after-load 'company '(add-to-list 'company-backends 'company-cider))

 ;; CIDER config
 (setq cider-show-error-buffer nil)

 ;; Indent all newlines
 (define-key global-map (kbd "RET") 'newline-and-indent)

 ;; Disable the splash screen
 (setq inhibit-splash-screen t)

 (add-hook 'after-init-hook 'prettify-symbols-mode)
 (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))
 (setq js-indent-level 2)
 (setq jsx-indent-level 2)

 (setq-default tab-width 2)
 (setq-default indent-tabs-mode nil)
 (setq-default standard-indent 2)

 (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

 (winner-mode 1)

 ;; Enable mouse support on terminal emacs
 (unless window-system
   (require 'mouse)
   (xterm-mouse-mode t)
   (global-set-key [mouse-4] '(lambda ()
                                (interactive)
                                (scroll-down 1)))
   (global-set-key [mouse-5] '(lambda ()
                                (interactive)
                                (scroll-up 1)))
   (defun track-mouse (e))
   (setq mouse-sel-mode t))

 ;; Custom Keybindings

 (defun disable-keybinding ()
   "Just display a message instead of invoking this keybinding."
   (interactive)
   (message "Sorry, can't do this!"))


 (global-set-key (kbd "M-C-w") 'sp-copy-sexp)
 (global-set-key (kbd "s-k") 'kill-whole-line)
 (global-set-key [f8] 'neotree-toggle)
 (global-set-key (kbd "M-q") 'cider-quit)
 (global-set-key (kbd "s-t") 'helm-projectile)
 (global-set-key (kbd "C-c t") 'helm-projectile)
 (global-set-key (kbd "C-x b") 'helm-buffers-list)
 (global-set-key (kbd "M-x") 'helm-M-x)
 (global-set-key (kbd "C-c f") 'helm-recentf)
 (global-set-key (kbd "C-x C-f") 'helm-find-files)
 (global-set-key (kbd "C-x C-z") 'disable-keybinding))
