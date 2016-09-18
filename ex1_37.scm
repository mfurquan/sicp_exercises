(define (cont-frac n d k)
  (define (itr i result)
    (if (= i 0)
      result
      (itr (- i 1) (/ (n i) (+ (d i) result)))))
  (itr k 0))

(define (cont-frac-rec n d k)
  (define (index n) (+ k (- n) 1))
  (if (= k 0)
    0
    (/ (n (index k)) (+ (d (index k)) (cont-frac-rec n d (- k 1))))))
