(let ((x 'a) (y 3))
  (let ((f (lambda (o t) (o t t))))
    (f cons x)
    (f + y)))

(let ((double (lambda (x) (+ x x))))
  (list (* 3 4)
	(/ 99 11)
	(- 2 7)))

(let ((x 'a))
  (let ((f (lambda (y) (list x y))))
    (f 'c)))

(let ([f (let ([x 'sam])
	              (lambda (y z) (list x y z)))])
    (f 'i 'am))
