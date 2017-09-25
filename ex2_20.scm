(define (same-parity . l)
  (define (par? x)
    (if (even? (car l)) (even? x) (odd? x)))
  (define (sp-iter arg par)
    (if (null? arg) par
      (if (par? (car arg))
	(sp-iter (cdr arg) (cons (car arg) par))
	(sp-iter (cdr arg) par))))
  (reverse (sp-iter l '())))
