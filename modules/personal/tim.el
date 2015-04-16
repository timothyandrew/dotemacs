(nel:require-packages 'guru-mode 'helm 'god-mode 'sublimity 'ace-window 'ace-jump-mode)

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

 (define-key input-decode-map "\e[1;5A" [C-up])
 (define-key input-decode-map "\e[1;5B" [C-down])
 (define-key input-decode-map "\e[1;5C" [C-right])
 (define-key input-decode-map "\e[1;5D" [C-left])

 (define-key input-decode-map "\e[40;6u" 'sp-backward-slurp-sexp)
 (define-key input-decode-map "\e[41;6u" 'sp-forward-slurp-sexp)

 (define-key input-decode-map "\e[123;6u" 'sp-backward-barf-sexp)
 (define-key input-decode-map "\e[125;6u" 'sp-forward-barf-sexp)

 ;; Custom Keybindings

 (defun disable-keybinding ()
   "Just display a message instead of invoking this keybinding."
   (interactive)
   (message "Sorry, can't do this!"))


 ;; Copy to System Clipboard on Linux
 (setq x-select-enable-clipboard t)
 (setq x-select-enable-primary t)

 (global-hl-line-mode 0)

 ;; ACE Window
 (global-set-key (kbd "M-p") 'ace-window)
 (add-hook 'cider-repl-mode-hook
           (lambda ()
             (progn
               (local-set-key (kbd "M-p") 'ace-window))))
 (add-hook 'magit-mode-hook
           (lambda ()
             (progn
               (local-set-key (kbd "M-p") 'ace-window))))

 ;; SSH Agent

 (defun refresh-ssh-agent ()
   (interactive)
   (with-temp-buffer
     (insert-file-contents (expand-file-name "~/.ssh/latestagent"))
     (dolist (varname '("SSH_AUTH_SOCK" "SSH_CLIENT" "SSH_TTY" "SSH_CONNECTION"))
       (goto-char 0)
       (re-search-forward (concat "export " varname "=\"\\(.*\\)\""))
       (setenv varname (match-string 1)))))

 ;; Disable GUI Stuff
 (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
 (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
 (setq menu-prompting nil)

 ;; Uniquify
 (require 'uniquify)
 (setq uniquify-buffer-name-style 'post-forward)

 (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
 (define-key global-map (kbd "M-o") 'ace-jump-mode)


 (global-set-key (kbd "C-c r") 'refresh-ssh-agent)
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
