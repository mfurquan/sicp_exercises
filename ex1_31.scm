(define (product term a next b)
  (define (iter a result)
    (if (> a b) result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (approx-pi n)
  (define (term i)
    (if (even? i) (/ i (+ i 1))
      (/ (+ i 1) i)))
  (define (next i) (+ i 1))
  (* 4 (product term 2 next (+ n 1))))

(define (product-rec term a next b)
  (if (> a b) 1)
  (* (term a) (product-rec term (next a) next b)))
