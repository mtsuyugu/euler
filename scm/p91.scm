

(define p91 (lambda ()
   (letrec ((size 50)
            (inner (lambda (a b c d) (+ (* a c) (* b d))))
            (check (lambda (x y i j)
                     (or (= 0 (inner x y (- x i) (- y j)))
                         (= 0 (inner (- i x) (- j y) i j)))))
            (find (lambda (x y)
                    (if (= y 0) size
                      (let ((start (if (= x 0) 1 0))
                            (end (- y 1)))
                        (let loop ((i (+ x 1))
                                   (j start)
                                   (n (if (= x 0) (* size 2) 0)))
                          (cond ((> i size) n)
                                ((> j end) (loop (+ i 1) start n))
                                (else (loop i (+ j 1)
                                            (+ n (if (if (= x 0)
                                                       (= 0 (inner (- i x) (- j y) i j))
                                                       (check x y i j))
                                                   1 0))))))))))
            (iter (lambda (x y total)
                    (cond ((> x size) total)
                          ((> y size) (iter (+ x 1) 0 total))
                          (else (iter x (+ y 1) (+ total 
                                                   (if (and (= x 0) (= y 0))
                                                     0
                                                     (find x y)))))))))
     (iter 0 0 0))))


(time
  (print (p91))
)
