(define table (make-hash-table))

(define (count ini)
  (define (next n)
    (if (= (modulo n 2) 0) (/ n 2) (+ (* n 3) 1)))
  (define (count-iter n i)
    (if (= n 1)
      (begin
        (hash-table-put! table ini i)
        i)
      (let1 memo (hash-table-get table n #f)
            (if memo
              (let1 newi (+ memo i -1)
                    (hash-table-put! table ini newi)
                    newi)
              (count-iter (next n) (+ i 1))))))
  (count-iter ini 1))

(define (p14)
  (let loop ((maxcount 0)
             (maxnum 0)
             (n 1))
    (if (= n 1000000) maxnum
      (let* ((newcount (max (count n) maxcount))
             (newnum (if (= newcount maxcount) maxnum n)))
            (loop newcount newnum (+ n 1))))))

(print (p14))
