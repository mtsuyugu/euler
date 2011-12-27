(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(define (p25)
  (let loop ((i 1))
    (if (>= (string-length (number->string (fib i))) 1000)
      i
      (loop (+ i 1)))))

(print (p25))
