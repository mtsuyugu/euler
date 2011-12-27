
(define (sum-digits num)
  (let loop ((r 0)
             (n num))
    (if (= n 0)
      r
      (loop (+ r (modulo n 10))
            (quotient n 10)))))


(define (p56)
  (let loop ((a 1)
             (b 1)
             (r 0))
    (if (= a 101)
      r
      (loop (if (= b 100) (+ a 1) a)
            (if (= b 100) 1 (+ b 1))
            (max r (sum-digits (expt a b)))))))

(print (p56))
