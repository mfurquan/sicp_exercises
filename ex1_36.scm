(define (f x)
  (/ (log 1000) (log x)))

(define (ave-f x)
  (average x (f x)))

(define (average x y)
  (/ (+ x y) 2))
