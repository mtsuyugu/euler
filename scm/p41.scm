(use srfi-1)
(load "./prime.scm")

(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

(define (number->list n)
  (let loop ((n n) (r '()))
    (if (= n 0)
      r
      (loop (quotient n 10) (cons (modulo n 10) r)))))

(define (pandigital? n)
  (list= = (iota (keta n) 1) (sort (number->list n))))

(define (p41)
  (let loop ((i 0)
             (max 0))
    (let1 p (stream-ref primes i)
          (when (= (modulo i 100) 0) (format #t "~s ~s\n" p max))
          (if (> p 7654321)
            max
            (loop (+ i 1) (if (pandigital? p) p max))))))
            

