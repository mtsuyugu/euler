(load "./util.scm")
(load "./eratosthenes.scm")

; all 9-digit numbers can be divisible by 3
(define (p41)
  (time
    (eratosthenes 100000000)
    )
  (fold-with-index (lambda (idx x r)
                     (if (and x (n-pandigital? idx))
                       idx
                       r))
                   1
                   prime-table))

(print (p41))
