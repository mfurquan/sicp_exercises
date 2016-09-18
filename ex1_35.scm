(define (f x)
  (+ 1 (/ 1 x)))

(define (golden-ratio)
  (fixed-point f 1))
