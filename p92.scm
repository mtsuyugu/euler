
(define square (lambda (x) (* x x)))
(define (next n)
  (+ (square (quotient n 10))
     (square (modulo n 10))))

(define tbl (make-hash-table))
