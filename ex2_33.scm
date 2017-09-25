(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (map1 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append1 seq1 seq2)
  (accumulate cons seq2 (car seq1)))

(define (length1 seq)
  (accumulate (lambda (x y) (+ y 1)) 0 seq))
