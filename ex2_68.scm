(load "ex2_60")
(load "ex2_67")

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (descend tree code)
    (if (leaf? tree)
      code
      (if (contains? (left-branch tree) symbol)
	(descend (left-branch tree) (append code '(0)))
	(descend (right-branch tree) (append code '(1))))))
  (if (contains? tree symbol)
    (descend tree '())
    (error "bad symbol - ENCODE TREE" symbol)))

(define (contains? tree symbol)
  (element-of-set? symbol (symbols tree)))
