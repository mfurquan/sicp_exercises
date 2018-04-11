(load "ex2_40")

(define (sum? s l)
  (= s (accumulate + 0 l)))

(define (unique-triplets n)
  (accumulate append '()
	      (accumulate append '()
			  (map (lambda (i)
				 (map (lambda (j)
					(map (lambda (k) (list i j k))
					     (enumerate-interval 1 n)))
				      (enumerate-interval 1 n)))
			       (enumerate-interval 1 n)))))

(define (sum-filtered-list sum n)
  (filter (lambda (x) (sum? sum x)) (unique-triplets n)))
