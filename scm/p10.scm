;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;Find the sum of all the primes below two million.

(load "./eratosthenes.scm")

(define N 2000000)
(time (eratosthenes N))

(define (p10)
  (fold-with-index (lambda (idx x n)
                     (if x (+ n idx) n))
                   0
                   prime-table))

(print (p10))
