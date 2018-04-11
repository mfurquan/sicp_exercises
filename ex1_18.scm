(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (* m n)
  (cond ((= n 0) 0)
	((odd? n) (+ m (* m (- n 1))))
	(else (* (double m) (halve n)))))
