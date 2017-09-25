(load "ex2_33")

;(define (count-leaves t)
;  (define (binarize i)
;    (if (pair? i) (map binarize i) 1))
;  (define (t+ x y)
;    (if (pair? x) (+ (count-leaves x) y) (+ x y)))
;  (accumulate t+ 0 (map binarize t)))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))
