(define (deriv expr var)
  (cond ((number? expr) 0)
	((variable? expr)
	 (if (same-variable? expr var) 1 0))
	(else
	  ((get 'deriv (operator expr))
	   (operands expr)
	   var))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (operator expr) (car expr))

(define (operands expr) (cdr expr))

(define (make-sum augend addend)
  (get 'make-sum))

(define (install-sum)
  (define (=zero? x) (and (number? x) (= x 0)))
  (define (make-sum a b)
    (cond ((=zero? a) b)
	  ((=zero? b) a)
	  ((and (number? a) (number? b)) (+ a b))
	  (else (list '+ a b))))
  (define ())
  (define (deriv expr var)
    (make-sum (deriv (car (operands expr)) var)
	      (deriv (cdr (operands expr)) var))))

(define (install-product)
  (define (make-expr)))

