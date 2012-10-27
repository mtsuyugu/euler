
(define (p65)
  (let ((nth-fract (lambda (n)
                     (letrec ((denomi (lambda (n)
                                        (if (= (modulo n 3) 2) 
                                          (* 2 (+ (quotient n 3) 1))
                                          1)))
                              (iter (lambda (start end)
                                      (if (= start end)
                                        (/ 1 (denomi start))
                                        (/ 1 (+ (denomi start) 
                                                (iter (+ start 1) end)))))))
                       (if (= n 1) 2
                         (+ 2 (iter 1 (- n 1)))))))
        (sum-digits (lambda (num)
                      (letrec ((iter (lambda (r n)
                                       (if (= n 0)
                                         r
                                         (iter (+ r (modulo n 10))
                                               (quotient n 10))))))
                        (iter 0 num)))))
    (sum-digits (numerator (nth-fract 100)))))

(print (p65))

