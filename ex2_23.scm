(define (for-each1 proc items)
  (if (null? items)
    #t
    (and (proc (car items))
	 (for-each1 proc (cdr items)))))
