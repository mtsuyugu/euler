(define % (lambda (x y) (= (modulo x y) 0)))

(define (divisors x)
  (let ((limit (sqrt x)))
    (let loop ((i 2) (result '(1)))
      (if (> i limit)
        result
        (let* ((qm (call-with-values (lambda () (quotient&remainder x i)) cons))
               (q (car qm))
               (m (cdr qm)))
          (loop (+ i 1)
                (cond ((not (= m 0)) result)
                      ((= q i) (cons i result))
                      (else (list* q i result)))))))))
