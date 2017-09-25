(load "ex2_7.scm")

(define (make-center-percent c p)
  (let ((w (* 0.01 c p)))
  (make-interval (- c w) (+ c w))))

(define (percent interval)
  (let ((w (/ (- (upper-bound interval)
     	         (lower-bound interval)) 2))
        (c (/ (+ (upper-bound interval)
	 	 (lower-bound interval)) 2)))
    (* (/ w c) 100)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

