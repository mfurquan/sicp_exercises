(load "ex2_63")
(load "ex2_64")

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) #t)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (make-set s) (list->tree s))
(define (get-set s) (tree->list-2 s))

(define (union-set set1 set2)
  (if (null? set1) set2
    (union-set (left-branch set1) (union-set (right-branch set1) (adjoin-set (entry set1) set2)))))

(define (singleton? tree) (if (and (null? (left-branch tree)) (null? (right-branch tree))) #t #f))

(define (intersection-set set1 set2)
  (cond ((null? set1) '())
	((singleton? set1) (if (element-of-set? (entry set1) set2) set1 '()))
	(else (if (element-of-set? (entry set1) set2)
		(adjoin-set (entry set1) (union-set (intersection-set (left-branch  set1) set2)
		         			    (intersection-set (right-branch set1) set2)))
		(union-set (intersection-set (left-branch  set1) set2)
			   (intersection-set (right-branch set1) set2))))))
