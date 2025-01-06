
;; common lisp will make a hash table , emacs lisp will not be able to do this 
(defparameter *my-hash* (make-hash-table))



(setq lisp-mode-hook (remq 'slime-lisp-mode-hook lisp-mode-hook))
lisp-mode-hook 

