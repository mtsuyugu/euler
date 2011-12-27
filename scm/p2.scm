(load "./util.scm")
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
    (fib-iter 1 0 n))

(define (p2 maxnum)
   (let loop ((n 1)
              (answer 0))
      (let1 fibn (fib n)
            (if (> fibn maxnum)
              answer
              (loop (+ n 1)
                    (+ answer (if (% fibn 2) 
                                fibn 
                                0)))))))

(print (p2 4000000))


