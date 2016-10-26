(load "ex1_43")
(load "adaptive-plot/load")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (repeated-smooth f n)
  (repeated smooth n))

(define (f x)
  (+ (sin x) (sin (* 10.0 dx x))))

(define (plot-smoothened n)
  (gnuplot (repeated-smooth f n) -10.0 10.0))
