;;; package --- Config
;;; Commentary:
;;;  My personal emacs settings (sans keybindings - see key-bindings.el)

;;; Code:

;; Default directory on load
(cd "~/development")

;; Theme/Font updates
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(sp-show-pair-match-face ((t (:background "#F0DFAF" :weight bold))))
 ;; '(highlight ((t (:background "#F0DFAF"))))
 '(idle-highlight ((t (:inherit region :background "#F0DFAF")))))

;; Rainbow delimiters everywhere
(rainbow-delimiters-mode t)

;; Highlight naughty whitespace
(whitespace-mode t)

;; Try to keep lines short
(auto-fill-mode t)

;; Docs all the places
(eldoc-mode t)

;; Cleanup buffer whenever before we save
;; (add-hook 'before-save-hook 'cleanup-buffer)

;; Highlight tags in programming mode
(add-hook 'prog-mode-hook 'highlight-tags)

;; Highlight occurences of word under point in any programming mode
(require 'idle-highlight-mode)
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))

;; Paredit errwhere baby!
;; (require 'paredit)
;; (setq-default paredit-mode t)

;; Custom saveplace file
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saved-places")


;; File modes/extensions

(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml[c]?$" . haml-mode))
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.cljx$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

(add-hook 'clojure-mode-hook (lambda () (setq-default cider-mode t)))

;; Cider setup

(require 'cider)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Helm setup

;; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; make TAB works in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
;; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action)

(provide 'config)
;;; config.el ends here
