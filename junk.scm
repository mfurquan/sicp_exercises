(load "ex2_40")

(define (foo n)
  (map (lambda (i)
       (map (lambda (j) (list i j))
	    (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)))
