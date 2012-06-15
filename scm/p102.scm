(define p102
  (lambda ()  
    (call-with-input-file "p102_data.txt"
       (lambda (port)
         (letrec ((cross-product (lambda (x1 y1 x2 y2) (- (* x1 y2) (* x2 y1))))
                  (dir (lambda (x1 y1 x2 y2) 
                         (let ((n (cross-product x1 y1 x2 y2)))
                           (cond ((= n 0) 0)
                                 ((< n 0) 1)
                                 (else -1)))))
                  (has-origin? (lambda (x1 y1 x2 y2 x3 y3) 
                                 (let ((d1 (dir (- x1 x2) (- y1 y2) x1 y1)))
                                   (and (not (= d1 0)) 
                                        (= d1  
                                           (dir (- x2 x3) (- y2 y3) x2 y2) 
                                           (dir (- x3 x1) (- y3 y1) x3 y3))))))
                  (iter (lambda (line n)
                          (if (eof-object? line)
                            n   
                            (iter (read-line port)
                                  (+ n (if (apply has-origin? (map string->number (string-split line #\,)))
                                         1 0)))))))
           (iter (read-line port) 0))))))


(print (p102))
