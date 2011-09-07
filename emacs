;; load stuff
(let ((default-directory "~/.emacs.d/site-lisp/"))
   (normal-top-level-add-subdirs-to-load-path))

(require 'org-install)
(require 'cl)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; org-mode
(setq orgdir "/home/clay/org/")
(setq org-mobile-directory "/home/clay/orgMobile/")
(add-to-list 'auto-mode-alist '("/home/clay/org/" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)

(setq org-default-notes-file (concat orgdir "/Notes"))

(setq org-enforce-todo-dependencies 'true)
(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/org/Day Plan")
         "* TODO %?\n  %i\n  %a")
    ("j" "Journal" entry (file+datetree "~/org/Journal.gpg")
         "* %U %? %^g\n  %i %a")))

(setq org-agenda-files (list "/home/clay/org/Day Plan"))

(setq my-save-ignore-files 
      '())

(defun commit-after-save-org ()
  (let ((filename (buffer-file-name)))
    (when (and (string-match orgdir filename)
           (not (find-if '(lambda (ignore) 
                (string-match (regexp-quote ignore) filename)) 
                 my-save-ignore-files)))
      (let ((commit-file (concat "git add \"" (buffer-file-name) 
                 "\" && git commit -m '" filename "'"))
        (olddir default-directory))
    (save-excursion
      (cd orgdir)
      (shell-command commit-file))
    (cd olddir)))))

(setq org-archive-location "Log/%s::")
(add-hook 'after-save-hook 'commit-after-save-org)

;; python
;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
    (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; EMACS CONFIG
;; open scratch buffer on start
(setq initial-scratch-buffer nil)
(setq initial-buffer-choice "/home/clay/org/Day Plan")

;; get rid of annoying top bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; COLOR THEME
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

;; line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

(prefer-coding-system 'utf-8)
