(use srfi-1)

(define (sum-of-fifth-power n)
  (apply +
        (map (lambda (x) (expt (modulo 
                                 (quotient n x)
                                 10)
                               5))
             (list 1 10 100 1000 10000 100000 1000000))))

(define (p30)
  (apply +
        (filter (lambda (x) (= x (sum-of-fifth-power x))) 
                (iota 1000000 2 1))))

(display (p30))

