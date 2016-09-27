(load "fixed-point")
(load "ex1_43")

(define (root x rad)
  (fixed-point ((repeated average-damp (repeat rad))
		(lambda (y)
		  (/ x (expt y (- rad 1))))) 1))

(define (repeat rad)
  (define (itr rep)
    (if (and (>= rad (expt 2 rep)) (< rad (expt 2 (+ rep 1))))
      rep
      (itr (+ rep 1))))
    (itr 0))
