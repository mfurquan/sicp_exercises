(define (tan-cf x k)
  (define (n i)
    (+ (* (- i 1) 2.0) 1))
  (define (itr i result)
    (if (= i 1)
      result
      (itr (- i 1) (- (n (- i 1)) (/ (* x x) result)))))
  (/ x (itr k (n k))))
