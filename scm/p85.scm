
(define (p85)
  (letrec ((max-num 2000000)
           (dummy (list 0 0 0 0 max-num))
           (count (lambda (c r col row) (* (+ (- col c) 1) (+ (- row r) 1))))
           (count-all (lambda (c r col row)
                        (let loop ((c 1) (r 1) (n 0))
                          (cond ((> c col) n)
                                ((> r row) (loop (+ c 1) 1 n))
                                (else (loop c (+ r 1) (+ n (count c r col row))))))))
           (diff (lambda (n) (abs (- n max-num))))
           (choice-lower-diff (lambda (a b) (if (< (ref a 4) (ref b 4))
                                              a b)))
           (iter (lambda (col row result tmp end)
                   (if (and (> end 0) (> row end)) result
                     (let* ((n (count-all 1 1 col row))
                            (diff-n (diff n))
                            (record (list col row (* col row) n diff-n)))
                       (cond ((< n max-num) (iter (+ col 1) row result record end))
                             (else 
                               (let ((nearest (if (< (ref tmp 4) diff-n) tmp record)))
;                                 (print nearest)
                                 (iter 1 (+ row 1) 
                                       (choice-lower-diff nearest result)
                                       dummy
                                       (if (= end 0) col end))))))))))
    (iter 1 1 dummy '() 0)
    ))



(print (p85))




