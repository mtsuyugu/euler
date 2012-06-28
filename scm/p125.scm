(use srfi-13)

(define (p125)
  (letrec ((max-num 100000000)
           (ht (make-hash-table))
           (iter-inner (lambda (j sum total)
                (let ((sum (+ sum (* j j))))
                  (if (> sum max-num) 
                    total
                    (iter-inner (+ j 1) sum 
                                (if (and (palindomic? sum) (not (hash-table-get ht sum #f)))
                                  (begin 
                                    (hash-table-put! ht sum 1)
                                    (+ total sum))
                                  total))))))
           (iter (lambda (i total)
                   (let ((sum (* i i)))
                     (if (> sum max-num)
                       total
                       (iter (+ i 1) (iter-inner (+ i 1) sum total))))))
           (palindomic? (lambda (n) 
                          (let ((str (number->string n)))
                            (string=? str (string-reverse str)))))
           )   
    (iter 1 0)))

(time (print
  (p125)
))

