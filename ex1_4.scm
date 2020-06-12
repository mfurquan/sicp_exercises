#!gsi-script
(define (new-if predicate then-clause else-clausse)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (cond ((good-enough? guess x)
    guess)
    (else (sqrt-iter (improve guess x)
	       x))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqroot x)
  (sqrt-iter 1 x))
