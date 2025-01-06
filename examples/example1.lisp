
;; requires lem 2.0 built with sdl2 library
;;
;; open this file in lem 
;; C-c C-k compile this file
;;
;; should see an image of lem logo 
;;


(defpackage :example1
  (:use :cl
        :lem
        :lem-sdl2)
  (:export #:draw))

(in-package :example1)

;; because we dump images and possibly text to screen good idea to have own buffer
(define-major-mode example1-mode nil
    (:name "example1"
     :keymap *example1-mode-keymap*))

(defvar *example1-buffer*)  


;; what do if user does not have this image?
(defvar *icon-image*
  (lem-sdl2/graphics:load-image
   (merge-pathnames "code/lem/frontends/sdl2/resources/icon.png"
                    (user-homedir-pathname))))

;; what do if user does not have this font?
(defvar *font*
  ;; (sdl2-ttf:open-font (merge-pathnames ""  (use-homedir-pathname))   300)
  (sdl2-ttf:open-font "/usr/share/fonts/opentype/noto/NotoSansCJK-Medium.ttc"  300))



(defvar *color-1* (make-color 241 242 244))
(defvar *color-2* (make-color 255 179 41))
(defvar *color-3* (make-color 176 208 233))


(defun draw ()
  (let ((buffer (make-buffer "*example1*")))
    (lem-sdl2/graphics:clear-drawables buffer)
    (lem-sdl2/graphics:draw-image buffer
                *icon-image*
                :x 300
                :y 10
                :width 500
                :height 500)
    (lem-sdl2/graphics:draw-string buffer
                 "Lisp"
                 10
                 500
                 :font *font*
                 :color *color-1*)
    (lem-sdl2/graphics:draw-rectangle buffer 500 200 500 500 :filled t :color *color-3*)
    (lem-sdl2/graphics:draw-rectangle buffer 100 400 500 500 :filled t :color *color-2*)
    ;; no procedure display-buffer??
    (switch-to-buffer buffer)
    ;;(pop-to-buffer buffer)
    ;; display buffer has been deprecated and is no longer available
    ;;(display-buffer buffer)
    ))


;; M-x example1 
(define-command example1 () ()
  (setq *example1-buffer* (make-buffer "*example1*"))
  (switch-to-buffer *example1-buffer*)
  (example1-mode)

  ;; any cleanup required ?
  (add-hook (variable-value 'kill-buffer-hook :buffer *example1-buffer*)
            #'(lambda (buffer) (declare (ignore buffer))))

  ;; only draw once then we are done
  (draw))
  

;;(example1:draw)









    
              

