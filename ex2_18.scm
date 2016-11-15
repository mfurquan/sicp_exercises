(define (reverse1 l)
  (define (rev-iter str rev)
    (if (null? str) rev
      (rev-iter (cdr str) (cons (car str) rev))))
  (rev-iter l '()))
