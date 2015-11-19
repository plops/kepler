(defun f (ee e m)
  (- ee (* e (sin ee)) m))

(defun f1 (ee e)
  (- 1 (* e (cos ee))))

(defun f2 (ee e)
  (* e (sin ee)))

(defun f3 (ee e)
  (* e (cos ee)))

(defun d1 (ee e m)
  (- (/ (f ee e m) (f1 ee e))))

(defun d2 (ee e m)
  (- (/ (f ee e m)
	(+ (f1 ee e)
	   (* .5 (d1 ee e m)
	      (f2 ee e))))))

(defun d3 (ee e m)
  (- (/ (f ee e m)
	(+ (f1 ee e)
	   (* .5 (d1 ee e m) (f2 ee e))
	   (* (/ 6) (expt (d2 ee e m) 2) (f3 ee e))))))


(let ((ee .00001)
      (e .99)
      (m (* 90 (/ 180) pi)))
 (loop for i below 20 collect (incf ee (d3 ee e m))))
