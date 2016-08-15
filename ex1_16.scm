(define (fast-exp-itr b n)
  (define (odd? n)
    (= (remainder n 2) 1))
  (cond ((= n 0) 1)
	((odd? n) (* b (fast-exp-itr b (- n 1))))
	(else (fast-exp-itr (* b b) (/ n 2)))))
