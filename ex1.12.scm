(define (pascal m n)
  (if (or (= n 1) (= m n))
       1
       (+ (pascal (- m 1) (- n 1))
	  (pascal (- m 1) n))))
