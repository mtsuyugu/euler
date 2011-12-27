(use util.list)
(use util.stream)
(load "./util.scm")

(define square (lambda (x) (* x x)))

(define (integers-starting-from n)
    (stream-cons n (integers-starting-from (+ n 1))))

(define prime-table (make-hash-table))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) 
           (hash-table-put! prime-table n #t) 
           #t)
          ((% n (stream-car ps)) #f)
          (else (iter (stream-cdr ps)))))
  (iter primes))

(define primes
  (stream-cons
    2
    (stream-filter prime? (integers-starting-from 3))))

(define (p7)
  (hash-table-put! prime-table 2 #t)
  (stream-ref primes 10000))

(print (p7))

;(print (sort (hash-table-keys prime-table)))
