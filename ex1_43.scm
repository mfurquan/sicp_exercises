(load "ex1_41")
(load "ex1_42")

(define (repeated f n)
  (cond ((= n 0) (lambda (x) x))
	((even? n) (double (repeated f (/ n 2))))
	(else (compose f (repeated f (- n 1))))))
