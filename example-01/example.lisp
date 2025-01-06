
;; ==================================
;; >ros run
;; starts a repl with quicklisp , sbcl 2.5.0
;; lem project is built with sdl2 only 
;; lem then added to the .bashrc to make available on the path
;; ==================================
;; C-c C-k compile this file
;;
;; if 
;;The name "LEM" does not designate any package.
;; how fix this ?
;; quicklisp cannot find lem or lem-sdl2
;; so this is somethign qlot is designed to solve ? on the bash terminal ?


(defpackage :example
  (:use :cl
        :lem
        :lem-sdl2))


        


(in-package :example)

;; (defun user-homedir-pathname ()  #p"/home/terry/")    

(defvar *icon-image*
  (lem-sdl2/graphics:load-image
   (merge-pathnames "code/lem/frontends/sdl2/resources/icon.png"
                    (user-homedir-pathname))))

(defvar *font*
  ;; (sdl2-ttf:open-font (merge-pathnames ""  (use-homedir-pathname))   300)
  (sdl2-ttf:open-font "/usr/share/fonts/opentype/noto/NotoSansCJK-Medium.ttc"  300))



(defvar *color-1* (make-color 241 242 244))
(defvar *color-2* (make-color 255 179 41))
(defvar *color-3* (make-color 176 208 233))


(defun draw ()
  (let ((buffer (make-buffer "*example*")))
    (lem-sdl2/graphics:clear-drawables buffer)
    (lem-sdl2/graphics:draw-image buffer
                *icon-image*
                :x 300
                :y 10
                :width 500
                :height 500)
    (lem-sdl2/graphics:draw-string buffer
                 "Rowan"
                 10
                 500
                 :font *font*
                 :color *color-1*)
    (lem-sdl2/graphics:draw-rectangle buffer 500 200 500 500 :filled t :color *color-3*)
    (lem-sdl2/graphics:draw-rectangle buffer 100 400 500 500 :filled t :color *color-2*)
    ;; no procedure display-buffer??
    (pop-to-buffer buffer)
    ;;(display-buffer buffer)
    ))

(draw)








    
              

