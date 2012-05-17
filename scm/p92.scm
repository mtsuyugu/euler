(use srfi-1)

(define (p92)
  (letrec ((maxN 9999999)
           (chain (lambda (n) 
                    (letrec ((square (^x (* x x)))
                             (iter (lambda (x sum)
                                     (if (= x 0)
                                       sum
                                       (iter (quotient x 10) (+ (square (modulo x 10)) sum))))))
                      (iter n 0))))
           (check (lambda (n)
                    (cond ((= n 89) #t)
                          ((= n 1) #f)
                          (else (check (chain n))))))
           (table (make-hash-table))
           (preliminary (lambda (n)
                          (let1 maxChain (chain maxN)
                                (if (<= n maxChain)
                                  (begin
                                    (hash-table-put! table n (check n))
                                    (preliminary (+ n 1)))))))
           (iter (lambda (n count)
                   (if (> n maxN)
                     count
                     (iter (+ n 1)
                           (+ count (if (hash-table-get table (chain n)) 1 0)))))))
    (preliminary 1)
    (iter 1 0)))
   
   
(time  
   (print (p92)) 
)


