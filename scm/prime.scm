(use util.stream)

(define divisible? (lambda (n d) (= (modulo n d) 0)))
(define square (lambda (x) (* x x)))

(define (integers-starting-from n)
    (stream-cons n (integers-starting-from (+ n 1))))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) #t)
          ((divisible? n (stream-car ps)) #f)
          (else (iter (stream-cdr ps)))))
  (if (= n 1) #f (iter primes)))

(define primes
  (stream-cons
    2
    (stream-filter prime? (integers-starting-from 3)))) 

(define factorized-ht (make-hash-table))

(define (copy-hash-table dst src)
  (hash-table-for-each src (lambda (k v) (hash-table-put! dst k v)))
  dst)

(define (prime-factorize num)
  (if (hash-table-get factorized-ht num #f)
    (hash-table-get factorized-ht num)
    (let1 ht (make-hash-table)
          (let loop ((n num)
                     (p primes))
            (if (= n 1) 
              (begin
                (hash-table-put! factorized-ht num ht)
                ht)
              (let* ((prime (stream-car p))
                     (div? (divisible? n prime))
                     (q (quotient n prime)))
                (when div? 
                  (let ((qhash (hash-table-get factorized-ht q #f)))
                    (when qhash
                      (copy-hash-table ht qhash)
                      (set! q 1))
                    (hash-table-put! ht prime (+ (hash-table-get ht prime 0) 1)))) 
                (loop (if div? q n) 
                      (if div? p (stream-cdr p)))))))))

(define (num-of-divisor num)
  (hash-table-fold (prime-factorize num) 
                   (lambda (k v p) (* p (+ v 1)))
                   1))

