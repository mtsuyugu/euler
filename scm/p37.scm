(use srfi-1)
(load "./prime.scm")

(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

(define (truncate-l-r n)
  (let1 k (keta n)
        (map (lambda (k) (modulo n (expt 10 k))) (iota k 1))))

(define (truncate-r-l n)
  (let1 k (keta n)
        (map (lambda (k) (quotient n (expt 10 (- k 1)))) (iota k 1))))

(define (truncatable? n)
  (and (every prime? (truncate-l-r n))
       (every prime? (truncate-r-l n))))

(define (p37)
  (let loop ((i 11) (r '()))
    (format #t "~s ~s\n" i r)
    (if (= (length r) 11)
      (apply + r)
      (loop (+ i 2) (if (truncatable? i)
                      (cons i r)
                      r)))))


