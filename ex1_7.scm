#!gsi-script
;define absolute-value function
(define (absolute x)
        (if (< x 0)
	     (- x)
	     x))
;define derivative of a function
(define (deriv f)
        (define dx 0.001)
	(lambda(x)
	  (/ (- (f (+ x dx))
		(f x))
	     dx)))
;newton-raphson method
(define (nr f guess)
  (define (nr-step x)
    (- x (/ (f x)
	    ((deriv f) x))))
  (define (good-enough? x)
    (< (abs (/ (- (nr-step x) x) (nr-step x))) 0.001))
  (define (try x)
    (display x) (newline)
    (if (good-enough? x)
      x
      (try (nr-step x))))
  (try guess))

;square-root using newton-raphson
(define (sqrt-nr x)
  (define (g y)
    (- (* y y) x))
  (nr g 1))
