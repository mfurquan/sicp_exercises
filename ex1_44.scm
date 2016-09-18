(load "ex1_43")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (repeated-smooth f n)
  (repeat smooth n))
