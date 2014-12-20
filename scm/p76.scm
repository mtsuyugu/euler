




(define tbl (make-hash-table))

(define (p m n)
  (cond ((= m 0) 1)
        ((= n 1) 1)
        ((< m n) (p m m))
        (else (let ((key (+ (* m 1000) n)))
                (unless (hash-table-exists? tbl key)
                  ((setter ref) tbl key (+ (p (- m n) n) (p m (- n 1)))))
                (ref tbl key)))))

(define (p76) (p 100 100))
(print (p76))
