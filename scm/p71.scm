(define p71 
  (lambda () (letrec ((iter (lambda (n d result)
                              (let ((frac (/ n d)))
                                (cond ((> d 1000000) result)
                                      ((>= frac (/ 3 7))
                                       (iter (floor (/ (* 3 (+ d 1)) 7)) (+ d 1) result))
                                      (else (iter (+ n 1) d (max frac result))))))))
               (numerator (iter 1 2 0)))))
(time (print (p71)))

