(use srfi-1)

(define (p116)
  (letrec ((maxunit 50) 
           (comb (lambda (n i)  
                   (if (> i (/ n 2)) 
                     (comb n (- n i)) 
                     (fold (lambda (x y) (/ y x)) 
                           (fold * 1 (iota i n -1))
                           (iota i 1)))))
           (iter (lambda (n c size)
                   (if (> (* n size) maxunit)
                     c   
                     (iter (+ n 1)
                           (+ c (comb (+ n (- maxunit (* n size))) n)) 
                           size))))
           (count (lambda (size) (iter 1 0 size))))
    (apply + (map count '(2 3 4)))
    ))  

(print (p116))

