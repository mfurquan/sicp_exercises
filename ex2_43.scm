(load "ex2_40")
(define empty-board '())

(define (adjoin-position i j old-list)
  (cons (list i j) old-list))

(define (safe? select-col positions)
  (let ((testee (car (filter (lambda (pos)
			       (= (cadr pos) select-col)) positions)))
	(check-list (filter (lambda (pos)
			      (not (= (cadr pos) select-col)))
			      positions)))
    (define (safety-test? checker)
      (let ((it (car testee))
	    (ic (car checker))
	    (jt (cadr testee))
	    (jc (cadr checker)))
	(not (or (= it ic)
		 (= (abs (/ (- it ic)
			    (- jt jc))) 1)))))
    (accumulate (lambda (x y) (and x y))
		#t (map safety-test? check-list))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (new-row)
	    (map (lambda (rest-of-queens)
			 (adjoin-position new-row k rest-of-queens))
		 (queen-cols (- k 1))))
	  (enumerate-interval 1 board-size)))))
  (queen-cols board-size))
