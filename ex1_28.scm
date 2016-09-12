(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (non-trivial? base (expmod base (/ exp 2) m) m)
		    m))
	(else
	(remainder (* base (expmod base (- exp 1) m))
		   m))))

(define (non-trivial? b a n)
  (if (and (not (or (= a 1) (= a (- n 1))))
	   (= (remainder (square a) n)
	      (remainder 1 n)))
    0
    (square a)))

(define (miller-rabin-test n)
  (define (try-it a)
    (not (= (expmod a (- n 1) n) 0)))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((miller-rabin-test n) (fast-prime? n (- times 1)))
	(else #f)))
