



(define-command slime-qlot-exec () ()
  (let ((command (first (lem-lisp-mode/implementation::list-roswell-with-qlot-commands))))
    (when command
      (lem-lisp-mode:run-slime command))))


;; add lem source code latest to quicklisp local projects
(push (merge-pathnames "code/lem/" (user-homedir-pathname)) 
      ql:*local-project-directories*)


;; how maximize frame ?
;;(lem-if:maximize-frame "sdl2")




