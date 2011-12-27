
(define (fact n)
  (define ht (make-hash-table))
  (if (hash-table-exists? ht n) 
    (hash-table-get ht n) 
    (let loop ((i n) (m 1))
      (if (= i 0) 
        (begin (hash-table-put! ht n m) m )
        (loop (- i 1) (* m i))))))

(define (fact-sum n)
  (fold (lambda (x y) (+ (fact (digit->integer x)) y)) 0 (string->list (number->string n))))

(define (p34)
  (let loop ((i 3)
             (result 0))
    (if (= i 100000) result
      (loop (+ i 1)
            (let1 factsum (fact-sum i)
                  (+ result
                     (if (= i factsum) factsum 0)))))))

(print (p34))
