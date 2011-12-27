(use util.stream)

(define (display-stream stream n)
  (let loop ((i 0)
             (s stream))
    (when (< i n)
      (format #t "~s\n" (stream-car s))
      (loop (+ i 1) (stream-cdr s)))))

(define divisible? (lambda (n d) (= (modulo n d) 0)))
(define square (lambda (x) (* x x)))

(define (integers-starting-from n)
  (stream-cons n (integers-starting-from (+ n 1))))

(define primes
  (stream-cons
    2
    (stream-filter prime? (integers-starting-from 3))))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) #t)
          ((divisible? n (stream-car ps)) #f)
          (else (iter (stream-cdr ps)))))
  (iter primes))

(define (p10)
  (let loop ((sum 0)
             (p primes))
    (if (> (stream-car p) 200000)
      sum
      (loop (+ sum (stream-car p)) (stream-cdr p)))))

(time (print (p10)))

