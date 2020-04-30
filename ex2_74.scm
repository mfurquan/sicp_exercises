(load "getput.scm")

(define (get-record employee-name personnel-file)
  ((get 'get-record 'div-name) personnel-file))

(define (get-salary record div-name)
  (get 'get-salary 'div-name) record)

(define (find-employee-record employee-name div-files-list)
  (filter (lambda (x) (not (null? x)))
	  (map (get 'find-employee-record (map car div-files-list))
	       employee-name
	       (map cdr div-files-list))))

(define (install-div-A)
  ; procedure definitions
  (put 'get-record 'div-A get-record)
  (put 'get-salary 'div-A get-salary)
  (put 'find-employee-record 'div-A find-employee-record))

(install-div-A)
