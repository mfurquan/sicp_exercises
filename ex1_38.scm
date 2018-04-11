(load "ex1_37")

(define (N i) 1.0)

(define (D i)
  (cond ((= i 1) 1.0)
	((= (remainder (- i 2) 3) 0)
	 (* 2.0 (+ (/ (- i 2) 3) 1)))
	(else 1.0)))

(define (comput-e m)
  (+ 2.0 (cont-frac N D m)))
