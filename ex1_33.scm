(define (filtered-accumulate combiner filter null-value term a next b)
  (define (itr a result)
    (if (> a b) result
      (if (filter a) (itr (next a) (combiner (term a) result))
	(itr (next a) result))))
    (itr a null-value))

(define (prime-square-sum a b)
  (filtered-accumulate + prime? 0 square a (lambda (x) (+ x 1)) b))

(define (relative-prime-prod n)
  (filtered-accumulate * (lambda (x) (relative-prime? n x)) 1 (lambda (x) x) 1
		       (lambda(x) (+ x 1)) n))
