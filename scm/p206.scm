


(define (p206-iter i)
;  (if (= (modulo i 100000) 0) (print i))
  (let* ((j (+ i 30))
         (k (+ i 70))
         (match #/1\d2\d3\d4\d5\d6\d7\d8\d9\d0/)
         (found? (find (^x (match (number->string (* x x)))) (list j k))))  
    (or found? (p206-iter (+ i 100)))))


(define (p206) 
;  (p206-iter 10101010))
  (p206-iter (* (quotient (floor->exact (sqrt 1020304050607080900)) 100) 100)))

(print (p206))
