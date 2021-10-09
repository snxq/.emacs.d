;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

;; modify package source
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; import cl
(require 'cl)

(defvar snxq/packages '(
			;; auto completion
			company
			;; golang support
			go-mode
			;; markdown support
			markdown-mode
			;; theme
			monokai-theme
			) "Default Packages")

(defun snxq/package-installed-p ()
  (loop for pkg in snxq/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (snxq/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg snxq/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init-packages)

