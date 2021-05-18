;;; .emacs --- configuration
;;; Commentary:
;;;   This is Christoph's .emacs config, heavily inspired by Volker's
;;; Code:

(require 'package)
(setq package-enable-at-startup nil)
;;(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(add-to-list 'load-path "/Users/kepper/repos/kepper_emacs_conf")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;(require 'diminish)
(require 'bind-key)

(setq use-package-idle-interval 1)

(use-package diminish
  :ensure t)  ;; hide minor modes in modeline


(use-package basic_config)
(use-package file_modes)
(use-package appearance)
(use-package convenience)


(if (display-graphic-p)
    (load-theme 'solarized-dark t)
  ;; (load-theme 'dracula t)
  )


(use-package magit
  :ensure t
  :bind (("M-g" . magit-status))
  :init (progn
          (setq magit-push-always-verify nil)
          (setq magit-last-seen-setup-instructions "1.4.0"))
  )

;;##################################
;; ORG-Mode
;;##################################
;;(require 'org)
(use-package org
  :config
;;  (setq org-startup-indented t)
  )
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files '("~/Dropbox/org" "~/Dropbox/org/notes"))

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
(invert-face 'mode-line)
(run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; (if (display-graphic-p)
;; (use-package org-beautify-theme
  ;; :ensure t)
;; )

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;##################################
;; DEFT
;;##################################

;; Pfad bestimmen und Deft einbinden
;(add-to-list 'load-path "~/repos/kepper_emacs_conf/deft-multidir")
(require 'deft)

;; Deft mit F14 (auf Mac-Tastatur günstig gelegen) aufrufen
;; Auf dem Laptop rufe ich Deft mit 'C-c n' auf.
(global-set-key [f14] 'deft)
(global-set-key "\C-cn" 'deft)

;; Dateien nicht in ~/.deft/ sondern in einen Unterverzeichnis des Org mode Verzeichnisses ablegen
;; So werden die Notizdateien mit in mein Git-Repository einbezogen, in dem sich auch die anderen
;; Org mode Dateien befinden.
(setq deft-directory "~/Dropbox/org/notes/")

;; Org-Mode statt Text verwenden
(setq deft-extensions '("org"))
(setq deft-text-mode 'org-mode);; Pfad bestimmen und Deft einbinden
(setq deft-default-extension "org")
(setq def-use-filename-as-title t)

;; ##############################
;; Mac Keyboard fix
;; ##############################

(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)

;(global-set-key "\M-l" '(lambda () (interactive) (insert "@")))
;(global-set-key "\M-5" '(lambda () (interactive) (insert "[")))
;(global-set-key "\M-6" '(lambda () (interactive) (insert "]")))
;(global-set-key "\M-7" '(lambda () (interactive) (insert "|")))
;(global-set-key "\M-/" '(lambda () (interactive) (insert "\\")))
;(global-set-key "\M-8" '(lambda () (interactive) (insert "{")))
;(global-set-key "\M-9" '(lambda () (interactive) (insert "}")))
;(global-set-key "\M-n" '(lambda () (interactive) (insert "~")))
;(global-set-key "\M-e" '(lambda () (interactive) (insert "€")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3d5720f488f2ed54dd4e40e9252da2912110948366a16aef503f3e9e7dfe4915" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (cypher-mode solarized-theme dracula-theme powerline-evil default-text-scale evil color-theme-solarized yaml-mode web-mode visual-regexp-steroids use-package undo-tree sr-speedbar smex smartparens smart-mode-line restclient rainbow-delimiters projectile pip-requirements markdown-mode magit json-mode js2-mode jira-markup-mode ignoramus ido-vertical-mode ido-ubiquitous hiwin highlight-symbol groovy-mode flx-ido expand-region es-mode dockerfile-mode deft comment-dwim-2 coffee-mode avy anzu ag adoc-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:family "Fira Sans")))))
;(mac-auto-operator-composition-mode)
(when (eq system-type 'darwin)

  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Fira Mono")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 140)
  
  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
;  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  
  ;; you may want to add different for other charset in this way.
  )
;;(require 'evil)
;;(evil-mode 0)

;; ##############################
;; Fira Code Ligatures
;; ##############################

(when (window-system)
  (set-frame-font "Fira Mono"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
