(load "./prime.scm")

(define (tri n) (/ (* n (+ n 1)) 2))

(define (p12)
  (let loop ((i 2))
    (let* ((tri (tri i))
           (num-div (num-of-divisor tri)))
      (if (>= num-div 500)
        tri
        (loop (+ i 1))))))

(print (p12))
