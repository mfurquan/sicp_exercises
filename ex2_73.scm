;(load "getput.scm")

(define (operator expr) (car expr))
(define (operands expr) (cdr expr))

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

(define (=number? expr num)
  (and (number? expr) (= expr num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (make-exponentiation b e)
  (cond ((=number? e 1)	b)
	((=number? e 0) 1)
	((and (number? b) (number? e)) (expt b e))
	(else (list '** b e))))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (install-sum)
  (define (deriv expr var)
    (make-sum (deriv (car (operands expr)) var)
	      (deriv (cdr (operands expr)) var)))
  (put 'deriv '(+) deriv))

(define (install-product)
  (define (deriv expr var)
    (let ((multiplier (car (operands expr)))
	  (multiplicand (cdr (operands expr))))
      (make-sum (make-product (deriv multiplier) multiplicand)
		(make-product multiplier (deriv multiplicand)))))
    (put 'deriv '(*) deriv))
