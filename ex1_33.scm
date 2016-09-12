(define (filtered-accumulate combiner filter null-value term a next b)
  (define (itr a result)
    (if (> a b) result
      (if (filter a) (itr (next a) result)
	(itr (next a) (combiner a result)))))
    (itr a null-value))
