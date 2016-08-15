(define (greater a b)
  (if (> a b) a b))

(define (sum-sqr a b)
  (+ (sqr a) (sqr b)))

(define (sqr a)
  (* a a))

(define (sum-of-greatest a b c)
  (cond ((> a b)
	 (sum-sqr a (greater b c)))
	(else (sum-sqr b (greater a c)))))
