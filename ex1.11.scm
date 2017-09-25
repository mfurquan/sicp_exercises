(define (f-rec n)
  (cond ((< n 3) n)
	(else (+ (f-rec (- n 1))
		 (* 2 (f-rec (- n 2)))
		 (* 3 (f-rec (- n 3)))))))

(define (f n)
  (define (f-itr a b c count)
    (if (= count 0)
      c
      (f-itr (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f-itr 2 1 0 n))
