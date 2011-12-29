;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;Find the sum of all the primes below two million.
(use srfi-1)

(load "./eratosthenes.scm")

(define N 2000000)
(time (eratosthenes N))

(define (p10)
  (fold (lambda (x n)
          (if (prime? x) (+ n x) n))
        0
        (iota N 1)))

(print (p10))
