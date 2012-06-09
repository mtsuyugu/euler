;(use srfi-1)


(define (p44)
  (letrec ((penta (lambda (n) (/ (* n (- (* 3 n) 1)) 2)))
           (penta? (lambda (x) (integer? (/ (+ 1 (sqrt (+ 1 (* 24 x)))) 6))))
           (check (lambda (penta-n penta-list)
                    (if (null? penta-list)
                      #f
                      (let ((penta-k (car penta-list)))
                        (if (and (penta? (+ penta-n penta-k))
                                 (penta? (- penta-n penta-k)))
                          (- penta-n penta-k)
                          (check penta-n (cdr penta-list)))))))
           (iter (lambda (i penta-list)
                   (let* ((penta-i (penta i))
                          (result (check penta-i penta-list)))
                     (if result result
                       (iter (+ i 1) (append penta-list (list penta-i))))))))
    (iter 1 '())))

(print (p44))
