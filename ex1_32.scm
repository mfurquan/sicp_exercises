(define (accumulate combiner null-value term a next b)
  (define (itr a result)
    (if (> a b) result
      (itr (next a) (combiner a result))))
    (itr a null-value))

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b) null-value
    (combiner (term a) 
	      (accumulate-rec combiner null-value term (next a) next b))))
