(use srfi-1)

(define (p28)
  (fold (lambda (n y) 
          (fold + y (map (lambda (x) (- (expt (- (* 2 n) 1) 2) (* x (- n 1)))) 
                          (iota 4 0 2))))
       1 (iota 500 2)))

(print (p28))

