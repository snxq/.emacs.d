;; ui management

;; close tool bar
;; close scroll bar
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; show line number
(global-linum-mode 1)

;; load theme
(load-theme 'monokai t)

(provide 'init-ui)

