(load "getput.scm")

(define (deriv expr var)
  (cond ((number? expr) 0)
	((variable? expr) (if (same-variable? expr var) 1 0))
	(else (let ((operator (car expr)) (operands (cdr expr)))
		((get operator 'deriv) operands var)))))

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
  (cond  ((or (=number? m1 0) (=number? m2 0)) 0)
	 ((=number? m1 1) m2)
	 ((=number? m2 1) m1)
	 ((and (number? m1) (number? m2)) (* m1 m2))
	 (else (list '* m1 m2))))

(define (make-exponentiation b e)
  (cond ((=number? e 1) b)
	((=number? e 0) 1)
	((and (number? b) (number? e)) (expt b e))
	(else (list '** b e))))

(define (install-sum)
  (define (deriv-sum operands var)
    (let ((augend (car operands)) (addend (cadr operands)))
      (make-sum (deriv augend var) (deriv addend var))))
    (put '+ 'deriv deriv-sum))

(define (install-product)
  (define (deriv-product operands var)
    (let ((multiplier (car operands)) (multiplicand (cadr operands)))
      (make-sum (make-product (deriv multiplier var) multiplicand)
 	        (make-product multiplier (deriv multiplicand var)))))
  (put '* 'deriv deriv-product))

(define (install-exponentiation)
  (define (deriv-exponentiation operands var)
    (let ((base (car operands)) (exponent (cadr operands)))
      (make-product exponent (make-exponentiation base (- exponent 1)))))
  (put '** 'deriv deriv-exponentiation))

(install-sum)
(install-product)
(install-exponentiation)
