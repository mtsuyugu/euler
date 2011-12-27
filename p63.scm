(use srfi-1)

(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

(define (nth-power-1-9 n)
  (map (cut expt <> n) (iota 9 1)))

(define (p63)
  (let loop ((n 1) (r 0))
    (let ((result (count (lambda (x) (= n (keta x))) (nth-power-1-9 n))))
      (if (= result 0)
        r
        (loop (+ n 1) (+ r result))))))

