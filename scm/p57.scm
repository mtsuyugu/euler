(use srfi-1)

(define root2
  (let ((r '()))
    (define (root-2-iter n)
      (let1 found (assq n r)
            (cond ((= n 0) (/ 1 2))
                  (found (cdr found)) 
                  (else 
                    (let1 v (/ 1 (+ 2 (root-2-iter (- n 1))))
                          (set! r (acons n v r))
                          v)))))
    (compose (pa$ + 1) root-2-iter)))

(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

(define (p57)
  (count (lambda (x) 
           (let* ((r2 (root2 x))
                  (n (keta (numerator r2)))
                  (d (keta (denominator r2))))
             (> n d))) (iota 1000)))
