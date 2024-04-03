(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))
(load "~/crafted-emacs/modules/crafted-init-config")

(menu-bar-mode -1)
(tool-bar-mode -1)

(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 70))


(setq load-path (append (list (expand-file-name "~/site-lisp")) load-path))
;; (require 'lilypond-init.el)
