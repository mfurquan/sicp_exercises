(load "ex2_33")

(define (accumulate-n op init seqs)
  (define (car-seq seq)
    (if (null? seq)
      '()
      (cons (caar seq) (car-seq (cdr seq)))))
  (define (cdr-seq seq)
    (if (null? seq)
      '()
      (cons (cdar seq) (cdr-seq (cdr seq)))))
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (car-seq seqs))
	  (accumulate-n op init (cdr-seq seqs)))))
