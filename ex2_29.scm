(define (make-mobile left right)
  (list left right))

(define (make-branch len struct)
  (list len struct))

(define (left-branch mob)
  (car mob))

(define (right-branch mob)
  (car (cdr mob)))

(define (branch-length br)
  (car br))

(define (branch-struct br)
  (car (cdr br)))

(define (total-weight mob)
  (+ (branch-weight (left-branch mob))
     (branch-weight (right-branch mob))))

(define (branch-weight br)
  (if (pair? (branch-struct br))
    (total-weight (branch-struct br))
    (branch-struct br)))

(define (torque br)
  (* (branch-length br) (branch-weight br)))

(define (balanced? mob)
  (define (bal struct)
    (= (torque (left-branch  struct))
       (torque (right-branch struct))))
  (if (pair? mob)
    (and (bal mob)
	 (balanced? (branch-struct (left-branch mob)))
	 (balanced? (branch-struct (right-branch mob))))
    #t))
