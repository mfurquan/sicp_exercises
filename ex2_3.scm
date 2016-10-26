(load "ex2_2")

;(define (make-rect corner width height)
;  (cons corner (cons width height)))
;
;(define (corner r)
;  (cad r))
;
;(define (width r)
;  (car (cdr r)))
;
;(define (height r)
;  (cdr (cdr r)))

(define (make-rect c1 c2)
  (cons c1 c2))

(define (corner1 r)
  (car r))

(define (corner2 r)
  (cdr r))

(define (width r)
  (- (x-point (corner2 r))
     (x-point (corner1 r))))

(define (height r)
  (- (y-point (corner2 r))
     (y-point (corner1 r))))

(define (area r)
  (* (width r) (height r)))

(define (perimeter r)
  (* 2 (+ (width r) (height r))))
