(use srfi-1)
(load "./eratosthenes.scm")

(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

(define (truncate-l-r? n keta-list)
  (every (lambda (k) (prime? (modulo n (expt 10 k)))) keta-list))

(define (truncate-r-l? n keta-list)
  (every (lambda (k) (prime? (quotient n (expt 10 (- k 1))))) keta-list))

(define (truncatable? n)
  (let1 keta-list (iota (keta n) 1)
        (and (truncate-l-r? n keta-list)
             (truncate-r-l? n keta-list))))

(define (p37)
  (eratosthenes 1000000)
  (let loop ((i 11) (r '()))
    (if (= (length r) 11)
      (apply + r)
      (loop (+ i 2) (if (and (prime? i) (truncatable? i))
                      (cons i r)
                      r)))))

(time
(print (p37))
)
