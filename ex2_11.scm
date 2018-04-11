(load "ex2_7.scm")

(define (mul-interval x y)
  (let ((l1 (lower-bound x))
	(u1 (upper-bound x))
	(l2 (lower-bound y))
	(u2 (upper-bound y)))
    (cond ((or (and (< l1 0)
		    (> u1 0)
		    (> l2 0)
		    (> u2 0))
	       (and (> l1 0)
		    (< u1 0)
		    (< l2 0)
		    (< u2 0)))
	   (make-interval (* l1 u2) (* u1 u2)))
	  ((or (and (> l1 0)
		    (< u1 0)
		    (> l2 0)
		    (> u2 0))
	       (and (< l1 0)
		    (> u1 0)
		    (< l2 0)
		    (< u2 0)))
	   (make-interval (* u1 u2) (* l1 u2)))
	  ((or (and (> l1 0)
		    (> u1 0)
		    (< l2 0)
		    (> u2 0))
	       (and (< l1 0)
		    (< u1 0)
		    (> l2 0)
		    (< u2 0)))
	   (make-interval (* u1 l2) (* u1 u2)))
	  ((or (and (> l1 0)
		    (> u1 0)
		    (> l2 0)
		    (< u2 0))
	       (and (< l1 0)
		    (< u1 0)
		    (< l2 0)
		    (> u2 0)))
	   (make-interval (* u1 u2) (* u1 l2)))
	  else (let ((p1 (* (lower-bound x) (lower-bound y)))
		     (p2 (* (lower-bound x) (upper-bound y)))
		     (p3 (* (upper-bound x) (lower-bound y)))
		     (p4 (* (upper-bound x) (upper-bound y))))
		 (make-interval (min p1 p2 p3 p4)
				(max p1 p2 p3 p4))))))
