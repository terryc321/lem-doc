

(asdf:defsystem "turtle"
  :depends-on ("cffi"  ;; foreign functions ? 
               "sdl2"  ;; sdl
               "sdl2-image"
               "cl-cairo2" ;; cairo?
               ;; "cl-opengl" ;; opengl 
               )
  :components ((:file "turtle")))




;; quicklisp list packages 
;; (ql:quickload :sdl2/examples)
;; (sdl2-examples:basic-test)

;; (ql:quickload :cairo2/examples)
;; (sdl2-examples:basic-test)

