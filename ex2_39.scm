(load "ex2_35")
(load "ex2_38")

(define (rreverse sequence)
  (fold-right (lambda (x y) (enumerate-tree (list y x))) '() sequence))

;(define (rreverse sequence)
;  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (lreverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
