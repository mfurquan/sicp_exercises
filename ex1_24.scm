(define (runtime)
    (* 1000000 (cpu-time)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
    (report-prime (- (runtime) start-time)) #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	  (remainder (* base (expmod base (- exp 1) m))
		     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	 ((fermat-test n) (fast-prime? n (- times 1)))
	 (else #f)))

(define (ranged-prime-test start count)
  (define inc (if (< count 0) -1 1))
  (if (equal? count 0)
    start
    (if (timed-prime-test start)
      (ranged-prime-test (+ start inc) (- count inc))
      (ranged-prime-test (+ start inc) count))))
