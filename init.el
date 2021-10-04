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

;; 更改 elpa 镜像地址
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; 开启全局 Company 补全
(global-company-mode 1)

