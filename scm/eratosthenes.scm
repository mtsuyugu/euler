(use gauche.sequence)

(define prime-table #f)
(define (eratosthenes n)
  (letrec ((make-prime-table (lambda (n) (set! prime-table (make-vector (+ n 1) #t))))
           (check (lambda (m) 
                    (let loop ((i (* m 2)))
                      (if (>= n i) 
                        (begin (vector-set! prime-table i #f)
                               (loop (+ i m)))))))
           (check-all (lambda (x)
                        (let loop ((i 2)) 
                          (if (<= i (/ n 2))
                            (begin 
                              (if (eq? (vector-ref prime-table i) #t)
                                (check i))
                              (loop (+ i 1))))))))
    (make-prime-table n)
    (vector-set! prime-table 1 #f)
    (check-all 2)))

(define (prime? x) (eq? (vector-ref prime-table x) #t))

