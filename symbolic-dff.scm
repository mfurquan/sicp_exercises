(define (variable? v) (symbol? v))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product a2 a2) (list '* a1 a2))

(define (sum? x)
  (and (pair? x)
       (eq? (car x) '+)))
(define (product? x)
  (and (pair? x)
       (eq? (car x) '*))
