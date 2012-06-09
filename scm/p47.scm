(use srfi-1)

(load "./util.scm")
(load "./eratosthenes.scm")


(define (p47)
  (define N 1000000)
  (eratosthenes N)
  (letrec ((prime-list (prime-list-less-than N))
           (prime-factorization
             (lambda (n)
               (letrec ((table (make-hash-table))
                        (iter (lambda (n prime-list)
                                (if (= n 1)
                                  table
                                  (let* ((p (car prime-list))
                                         (factor? (% n p)))
                                    (if factor? (hash-table-update! table p (cut + 1 <>) 0))
                                    (iter (if factor? (/ n p) n)
                                          (if factor? prime-list (cdr prime-list))))))))
                 (iter n prime-list))))
           (num-of-prime-factors
             (lambda (n) (hash-table-num-entries (prime-factorization n))))
           (iter (lambda (i)
                   (cond ((not (= (num-of-prime-factors i) 4))
                          (iter (+ i 1)))
                         ((not (= (num-of-prime-factors (+ i 1)) 4))
                          (iter (+ i 2)))
                         ((not (= (num-of-prime-factors (+ i 2)) 4))
                          (iter (+ i 3)))
                         ((not (= (num-of-prime-factors (+ i 3)) 4))
                          (iter (+ i 4)))
                         (else i)))))
    (iter 2)))

(time
  (print (p47))
)

