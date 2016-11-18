(define (deep-reverse l)
  (define (rev-iter str rev)
    (cond ((null? str) rev)
	  ((pair? str) str)
	  (else (rev-iter (cdr str) (cons (rev-iter (car str) '()) rev)))))
  (rev-iter l '()))