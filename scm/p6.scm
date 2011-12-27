(use srfi-1)

(define (p6)
  (let ((list100 (iota 100 1))
        (square (^x (* x x)))
        (sum (^x (fold + 0 x))))
    (- (square (sum list100))
       (sum (map square list100)))))

(print (p6))
