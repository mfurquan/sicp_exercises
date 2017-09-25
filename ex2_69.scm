(load "ex2_67")

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)    ; symbol
			     (cadr pair))  ; frequency
		  (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-leaves)
  (if (null? (cdr ordered-leaves))
    (car ordered-leaves)
    (successive-merge (adjoin-set (make-code-tree (car ordered-leaves)
						  (cadr ordered-leaves))
				  (cddr ordered-leaves)))))
