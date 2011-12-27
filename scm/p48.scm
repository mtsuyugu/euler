(use srfi-1)

(define (p48)
  (let1 n (iota 1000 1)
        (modulo
          ;(fold (lambda (x y) (+ y (expt x x))) 0 n)
          ;(apply + (map (lambda (x) (expt x x)) n))
          (apply + (map expt n n))
          ;(expt 10 10)
          10000000000)))

(print (p48))
