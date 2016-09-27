(define (iterative-improve good-enough improve)
  (define (itr g)
    (if (good-enough g)
      g
      (itr (improve g))))
  (lambda (guess)
  (itr guess)))

(define (sqrt-good-enough x)
  (lambda (guess)
    (< (abs (- (square guess) x)) 0.001)))

(define (sqrt-improve x)
  (lambda (guess)
    (/ (+ guess (/ x guess)) 2)))

(define (sqrt x guess)
  ((iterative-improve (sqrt-good-enough x) (sqrt-improve x)) guess))


(define (fp-close-enough? f)
  (lambda (x)
    (< (abs (- x (f x))) 0.0001)))

(define (fp-improve f)
  (lambda (x)
  (f x)))

(define (fixed-point f guess)
  ((iterative-improve (fp-close-enough? f) (fp-improve f)) guess))
