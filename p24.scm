(use srfi-1)

(define (permutation n k)
  (fold * 1 (iota k n -1)))

(define (p24)
  (let loop ((n 1000000)
             (digit (iota 10 0))
             (table (map (lambda (x) (permutation x x)) (iota 10 9 -1)))
             (result '()))
    (if (= n 0)
      (fold (lambda (x y) (+ (* y 10) x)) 0 
            (append (reverse result) (reverse digit)))
      (let* ((divisor (car table))
             (m (modulo n divisor))
             (d (list-ref digit (- (quotient n divisor)
                                   (if (= m 0) 1 0)))))
        (loop m
              (delete d digit)
              (cdr table)
              (cons d result))))))

(display (p24))
