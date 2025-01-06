
;; possible may want to control lem editor from emacs 
;; found possible using emacs plugin sly 
;; slime will not work as we will be redesigning swank

;; inside emacs setup sly 
;; M-x package-install RET sly RET
;; remove any slime from lisp-mode-hook
;; (setq lisp-mode-hook (remq 'slime-lisp-mode-hook lisp-mode-hook))
;; (setq inferior-lisp "where-sbcl-binary-lives")

;; start emacs 
;; M-x sly RET
;; so have sly repl 

;; LOAD this file into SLY repl using LOAD-FILE C-x C-l

(pushnew #p"/home/terry/code/lem/" ql:*local-project-directories* :test #'equalp)
(pushnew #p"/home/terry/src/slime-2.31/" ql:*local-project-directories* :test #'equalp)

(ql:quickload :lem)
(ql:quickload :lem-sdl2) 

;; this starts the editor up
(lem:lem)

;; now choice of example file to pick
;; example1.lisp - static image , rectangles and text
;; example2.lisp - moving image
;; 
;; == direct approach from inside LEM editor itself ==
;; can load example file from within the lem editor itself and compile the file
;; forcing the changes into the running editor
;; loaded example1.lisp from inside LEM editor
;; compile the file in LEM using C-x C-k
;; now LEM editor will have a command available using M-x 
;; M-x example1
;;
;; if loaded example2.lisp you will have to do M-x example2
;; 
;; simply opening the file in the LEM editor will not force changes to LEM editor itself
;; until the file is compiled by LEM
;;
;; this then allows changing the LEM editor from within LEM
;; there is more to do regards error recovery as many errors are simply not recoverable
;; 

;; === remote approach from emacs + sly ==
;; or load example file or example2.lisp from within emacs 
;;



