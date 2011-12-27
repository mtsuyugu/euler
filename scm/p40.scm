(use srfi-1)

; 123 -> '(1 2 3)
(define (number->list num)
  (let loop ((n num)
             (result '()))
    (if (= n 0) 
      result
      (loop (quotient n 10) (cons (modulo n 10) result)))))

; '(1 2 3 4 5 6 7 8 9 1 0 1 1 1 2 ...)
(define concat-digit 
  (apply (lambda ()
           (let loop ((i 1)
                      (len 0)
                      (result '()))
             (if (> len (expt 10 7))
               (reverse result)
               (loop (+ i 1)
                     (+ len (ceiling (/ (log i) (log 10))))
                     (fold cons result (number->list i)))))) '()))

(define (p40)
  (apply * (map (lambda (x) (list-ref concat-digit (- (expt 10 x) 1))) (iota 7))))

(print (p40))
