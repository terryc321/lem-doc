
;; example2 - moves image around LEM buffer

(defpackage :example2
  (:use :cl
        :lem
        :lem-sdl2)
  (:export #:draw))
  
(in-package :example2)

(define-major-mode example2-mode nil
    (:name "example2"
     :keymap *example2-mode-keymap*))

(defvar *example2-buffer*)  ;; where we do all our animation


;; (declaim (type fixnum *point-x*))
;; (declaim (type fixnum *point-x* *point-y*))
;; (declaim (type fixnum *point-x-max* *point-y-max*))
;; (declaim (type fixnum *point-x-min* *point-y-min*))
;; (declaim (type fixnum *anim-delay* *anim-delay-min* *anim-delay-start*))

(defvar *point-x* 5) ;; where text will be appearing in buffer
(defvar *point-y* 5)
(defvar *point-x-min* 5) ;; where text will be appearing in buffer
(defvar *point-y-min* 300)  ;; get graphics out way of text
(defvar *point-x-max* 400) ;; where text will be appearing in buffer
(defvar *point-y-max* 600)
(defvar *point-x-step* 20) ;; where text will be appearing in buffer
(defvar *point-y-step* 20)
(defvar *erase-buffer-each-frame* t) ;; true clears text and graphics 
(defvar *update-buffer-whatever* t) ;; true always update buffer if playing
(defvar *anim-delay* 100) 
(defvar *anim-delay-min* 10) 
(defvar *anim-delay-start* 200) 
(defvar *timer*)  ;; time the animation
(defvar *playing-p*)



;; init will just call reset
(defun init-player ()
  (setq *playing-p* t) ;; animation is playing
  (setq *anim-delay* *anim-delay-start*)
  (switch-to-buffer *example2-buffer*) ;; once made buffer switch to it    
  (reset-player))
  

;; reset put where want text on screen initially
(defun reset-player ()
  (setq *point-x* *point-x-min*)
  (setq *point-y* *point-y-min*))


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
(defvar *color-4* (make-color 30 30 30)) ;; black?

;; draw just delegates to draw next animation slide
(defun draw ()
  (draw-next))

(defun draw-next ()
  ;; (region
  ;;  (let ((whole-buffer (mark-set-whole-buffer)))
  ;; (kill-region (region-start *example2-buffer*) (region-end *example2-buffer*))
  ;; (delete-line asdf 
  (move-to-line (current-point) 0)
  (insert-string (current-point) (format nil "Please press q or Q to slow animation~%"))
  (insert-string (current-point) (format nil "Please press w or W to slow animation~%"))
  (insert-string (current-point) (format nil "Please press s or S to quicken animation~%"))
  (insert-string (current-point) (format nil "Please press C-x 0 to use whole screen~%"))
  (insert-string (current-point) (format nil "Please press C-x 2 to split screen vertically~%"))

  (insert-string (current-point) (format nil "Current animation rate is ~a~%" *anim-delay*))
  (newline)
    
  (lem-sdl2/graphics:clear-drawables *example2-buffer*)
  ;;(lem-sdl2/graphics:draw-rectangle *example2-buffer* 5 5 200 200 :filled t :color *color-4*)
  (lem-sdl2/graphics:draw-image *example2-buffer*
                                *icon-image*
                                :x *point-x*
                                :y *point-y*
                                :width 200
                                :height 200)
  (lem-sdl2/graphics:draw-string *example2-buffer*
                                 "Rowan"
                                 10
                                 500
                                 :font *font*
                                 :color *color-1*)
  (lem-sdl2/graphics:draw-rectangle *example2-buffer* 500 200 500 500 :filled t :color *color-3*)
  (lem-sdl2/graphics:draw-rectangle *example2-buffer* 100 400 500 500 :filled t :color *color-2*)
  ;; no procedure display-buffer??
  ;; may need to do other things in other buffers
  ;; does it matter if we do drawing in other buffers ? 
  ;; (switch-to-buffer *example2-buffer*)
  ;;(pop-to-buffer buffer)
  ;; display buffer has been deprecated and is no longer available
  ;;(display-buffer buffer)
  )



(define-command example-quit () ()
  (setq *playing-p* nil)
  (stop-timer *timer*))

;; when press a - i get a letter a appearing on screen
(define-command example-insert () ()
  ;;(insert-character (current-point) (character "A"))
  (insert-string (current-point) "ARRGGGHHH!!!")
  )


(defun alter-timer ()
  ;; stop old timer
  ;; start a new timer with new anim-delay   
  (stop-timer *timer*)
  (setq *timer* (start-timer (make-timer (lambda () (update *example2-buffer*))
                                         :handle-function (lambda (condition)
                                                            (pop-up-backtrace condition)
                                                            (stop-timer *timer*)))
                             *anim-delay*
                             :repeat t)))



(define-command example-faster () ()
  (decf *anim-delay* 20)
  (when (< *anim-delay* 10)
    (setq *anim-delay* *anim-delay-min*))
  (alter-timer))
  

(define-command example-slower () ()
  (incf *anim-delay*)
  (alter-timer))


;; define-key must then call a define-command 
(define-key *example2-mode-keymap* "q" 'example-quit)
(define-key *example2-mode-keymap* "a" 'example-insert)
(define-key *example2-mode-keymap* "Q" 'example-quit)
(define-key *example2-mode-keymap* "A" 'example-insert)

(define-key *example2-mode-keymap* "w" 'example-slower)
(define-key *example2-mode-keymap* "s" 'example-faster)
(define-key *example2-mode-keymap* "W" 'example-slower)
(define-key *example2-mode-keymap* "S" 'example-faster)


(defun update (example-buffer)
  (let ((shall-update (cond
                        (*update-buffer-whatever* t)
                        ((eq (current-buffer) example-buffer) t)
                        (t nil))))
    (when shall-update
      ;; clear buffer completely
      (when *erase-buffer-each-frame*
        (erase-buffer *example2-buffer*))
  
      ;; logic move text around 
      (incf *point-x* *point-x-step*)
      (when (> *point-x* *point-x-max*)
        (setq *point-x* *point-x-min*)
        (incf *point-y* *point-y-step*))
      (when (> *point-y* *point-y-max*)
        (setq *point-y* *point-y-min*)
        (setq *point-x* *point-x-min*))
      (draw)
      )))


;; M-x example2 
(define-command example2 () ()
  (setq *example2-buffer* (make-buffer "*example2*"))
  (switch-to-buffer *example2-buffer*)
  (example2-mode)
  
  
  (add-hook (variable-value 'kill-buffer-hook :buffer *example2-buffer*)
            #'(lambda (buffer) (declare (ignore buffer)) (example-quit)))
  
  (init-player)
  (draw)
  (setq *playing-p* t)
  (setq *timer* (start-timer (make-timer (lambda () (update *example2-buffer*))
                                         :handle-function (lambda (condition)
                                                            (pop-up-backtrace condition)
                                                            (stop-timer *timer*)))
                             *anim-delay*
                             :repeat t)))

;;(example2:draw)



