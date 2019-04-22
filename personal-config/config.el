;;##################################
;; ORG-Mode
;;##################################
(setq org-startup-indented t)

;;##################################
;; DEFT
;;##################################
;; Dateien nicht in ~/.deft/ sondern in einen Unterverzeichnis des Org mode
;; Verzeichnisses ablegen So werden die Notizdateien mit in mein Git-Repository
;; einbezogen, in dem sich auch die anderen Org mode Dateien befinden.
(setq deft-directory "~/Dropbox/org/notes/")

;; Org-Mode statt Text verwenden
(setq deft-default-extension "org")

;; default tab-width
(setq default-tab-width 4)

