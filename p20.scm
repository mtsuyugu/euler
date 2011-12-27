
(define (fact n)
  (let loop ((i n) (m 1))
    (if (= i 1) m (loop (- i 1) (* m i)))))

(define (p20)
  (fold (lambda (x n) (+ (digit->integer x) n)) 
        0
        (string->list (number->string (fact 100)))))

(print (p20))
