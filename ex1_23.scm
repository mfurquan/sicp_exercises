(define (runtime)
    (* 1000000 (cpu-time)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time)) #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define inc (if (equal? test-divisor 2) 1 2))
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor inc)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (ranged-prime-test start count)
  (define inc (if (< count 0) -1 1))
  (if (equal? count 0)
    start
    (if (timed-prime-test start)
      (ranged-prime-test (+ start inc) (- count inc))
      (ranged-prime-test (+ start inc) count))))
