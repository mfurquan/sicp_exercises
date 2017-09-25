(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (add-point p1 p2)
  (make-point
    (+ (x-point p1) (x-point p2))
    (+ (y-point p1) (y-point p2))))

(define (scale-point k p)
  (make-point
    (* k (x-point p))
    (* k (y-point p))))

(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment l) (car l))

(define (end-segment l) (cdr l))

(define (midpoint-segment l)
  (scale-point 1/2
	       (add-point
		 (start-segment l)
		 (end-segment l))))
