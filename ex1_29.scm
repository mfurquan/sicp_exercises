(define (sum term a next b)
  (if (or (> a b) (= a b)) 0
   (+ (term a) (sum term (next a) next b))))

(define (trap-intg f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(define (cube x) (* x x x))

(define (simp-intg f a b n)
  (define dx (/ (- b a) n))
  (define (term x)
    (+ (f x) (* 4 (f (+ x dx))) (f (+ x (* 2 dx)))))
  (define (next x) (+ x dx dx))
  (/ (* (sum term a next b) dx) 3))
