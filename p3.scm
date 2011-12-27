(load "./util.scm")

(define (p3)
  (let* ((target 600851475143)
         (limit (sqrt target)))
    (let loop ((i 2)
               (n target)
               (answer 2))
       (if (or (= n 1) (> i limit))
         answer
         (let1 factor? (% n i)
               (loop (+ i 1)
                     (if factor? (/ n i) n)
                     (if factor? i answer)))))))


(print (p3))
