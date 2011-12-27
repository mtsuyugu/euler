
(define (find-divisors n)
  (let loop ((i 2)
             (result '(1)))
    (if (> i (/ n 2)) result
      (loop (+ i 1)
            (if (= (modulo n i) 0) (cons i result) result)))))

(define (p21)
  (define ht (make-hash-table))
  (let loop ((i 1)
             (result 0))
    (let* ((di (hash-table-get ht i (fold + 0 (find-divisors i))))
           (ddi (hash-table-get ht di (fold + 0 (find-divisors di)))))
      (hash-table-put! ht i di)
      (hash-table-put! ht di ddi)
      (if (> i 10000) result
        (loop (+ i 1)
              (+ result (if (and (= ddi i) (not (= i di)))
                          i 0)))))))

(print (find-divisors 12))
(print (p21))

