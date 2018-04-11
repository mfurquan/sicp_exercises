(load "ex2_63")
(load "ex2_64")

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (look-up give-key set-of-records)
  (cond ((null? set-of-records) #f)
	((= x (get-key (entry set))) #t)
	((< x (get-key (entry set)))
	 (look-up given-key (left-branch set-of-records)))
	((> given-key (get-key (entry set)))
	 (lookup given-key (right-branch set-of-records)))))
