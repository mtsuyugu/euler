

(define (c n m)
  (if (= m 0) 1
    (* (/ (- (+ n 1) m) m)
       (c n (- m 1)))))


(print (c 40 20))
