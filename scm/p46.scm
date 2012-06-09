(use srfi-1)

(load "./eratosthenes.scm")

(define (p45)
  (let1 N 10000
        (eratosthenes N)
        (letrec ((prime-list (prime-list-less-than N))
                 (goldbach? (lambda (n)
                              (any (lambda (x) (integer? (sqrt (/ (- n x) 2))))
                                   prime-list)))
                 (iter (lambda (x)
                         (if (and (not (prime? x)) (not (goldbach? x)))
                           x
                           (iter (+ x 2))))))
          (iter 9))))

(print (p45))

