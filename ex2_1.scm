(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (if (< (* n d))
      (cons (- (abs (/ n g))) (abs (/ d g)))
      (cons (abs (/ n g)) (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))
