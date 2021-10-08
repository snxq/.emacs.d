;; emacs 配置根文件

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 绑定快捷键
(global-set-key (kbd "<f2>") 'open-init-file)

;; 重新加载配置文件
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; 绑定快捷键
(global-set-key (kbd "<f3>") 'reload-init-file)

;; 开启全局 Company 补全
(global-company-mode 1)

;; 关闭自动生成备份文件
(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 当 emacs 版本大于 24 时, 更改 elpa 镜像地址
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(defvar my/packages '(
		      ;; Auto-completion
		      company
		      ;; 搜索功能增强
		      swiper
		      ;; 管理成对的符号
		      smartparens
		      ;; --- Major Mode ---
		      ;; golang support
		      go-mode
		      ;; monokai 主题
		      monokai-theme
		      ;; 贪婪删除空格
		      hungry-delete
		      ) "Default package")
(setq package-selected-packages my/packages)

(require 'cl)
(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 加载主题
(load-theme 'monokai t)

