
;; turtle.lisp

;; https://glusoft.com/sdl2-tutorials/display-image-sdl_image/
;; also https://github.com/lispgames/cl-sdl2/blob/main/examples/basic.lisp

;; shadow naming conflicts from multiple packages 
;; https://stackoverflow.com/questions/74849565/common-lisp-name-clash-i-thought-the-package-system-was-supposed-to-protect-me
(defpackage :turtle
  (:use :cl
        :sdl2
        :sdl2-image
        ;; :cl-opengl  name clash on 
        )
  (:shadow :init :quit)
  (:export))
;; https://stackoverflow.com/questions/28906563/alias-package-names-in-common-lisp
;; init must explicitly be called as sdl2:init or sdl2-image:init
;; same for quit which is also shadowed


(in-package :turtle)

(defun foo () "foo here")

(defvar *init*)
(defvar *img-init*)
;; img-init 
;; WARNING: Unknown mask symbol :EVERYTHING, treated as 0; expected one of:
;; (:JPG :PNG :TIF :WEBP)

(defun init () 
  (setq *init* (sdl2:init* '(:everything)))
  (when (< *init* 0) (error "failed to init sdl"))
  (setq *img-init* (sdl2-image:init '(:jpg :png :tif :webp)))
  (when (not *img-init*) (error "failed to init sdl2-image")))

(defvar *window*)
(defvar *window-title* "First program")
(defvar *window-width* 800)
(defvar *window-height* 800)


#|
SDL_CreateWindow("First program", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_OPENGL);
if (window == NULL) {
std::cout << "Error window creation";
return 3;
}

the shocking lack of documentation about common lisp ,
common lisp libraries ffi etc all so very poor

 invalid number of arguments create-window
|#
(defun cw ()
  (setq *window* (sdl2:create-window :title *window-title* :shown))

                                     ;; :centered
                                     ;; :centered
                                     ;;  *window-width*
                                     ;;  *window-height*
                                     ;; '(:shown :opengl)))
                                     ;; ;; sdl-window-opengl ??
                                     
  (format t "window = ~a" *window*)
  )


;;stuck on (&key (:title )(:x )(:y ) (:w )(:h ) flags)







 








  

  ;; (setq *img-init* (sdl

                ;; '(:audio :video :event :haptic :sensors :everything))))

                ;; sdl2-ffi:+sdl-init-audio+
                ;; sdl2-ffi:+sdl-init-video+
                ;; sdl2-ffi:+sdl-init-events+ 
                ;; sdl2-ffi:+sdl-init-haptic+ 
                ;; sdl2-ffi:+sdl-init-sensor+
                ;; sdl2-ffi:+sdl-init-everything+
                ;; sdl2-ffi:+sdl-init-noparachute+
                ;; sdl2-ffi:+sdl-init-gamecontroller+









  
  
