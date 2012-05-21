;x + y = a2
;x - y = b2 = c2 - e2
;x + z = c2
;x - z = d2
;y + z = e2 = a2 - d2
;y - z = f2 = a2 - c2
;
;a > c > d
;
;x = (a2 + b2)/2
;y = (a2 - b2)/2
;z = (c2 - d2)/2



(define (p142)
  (letrec ((square? (^x (integer? (sqrt x))))
           (iter (lambda (a c d)
                   (cond ((<= a c) (iter (+ a 1) 2 1))
                         ((<= c d) (iter a (+ c 1) 1))
                         (else 
                           (let* ((a2 (* a a))
                                  (c2 (* c c))
                                  (d2 (* d d))
                                  (f2 (- a2 c2)))
                                 (if (or (<= f2 0) (not (square? f2)))
                                   (iter a (+ c 1) 1)
                                   (let ((e2 (- a2 d2)))
                                     (if (or (<= e2 0) (not (square? e2)))
                                       (iter a c (+ d 1))
                                       (let ((b2 (- d2 f2)))
                                         (if (or (<= b2 0) (not (square? b2)))
                                           (iter a c (+ d 1))
                                           (let ((x (/ (+ a2 b2) 2))
                                                 (y (/ (- a2 b2) 2))
                                                 (z (/ (- c2 d2) 2)))
                                             (if (and (integer? x) (integer? y) (integer? z))
                                               (+ x y z)
                                               (iter a c (+ d 1)))))))))))))))
    (iter 3 2 1)))

(print (p142))


