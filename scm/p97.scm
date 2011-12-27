

(define (expt2-last10 n)
  (let loop ((i 0)
             (result 1))
    (if (>= i n)
      result
      (loop (+ i 1) (modulo (* 2 result) 10000000000)))))

(define (p97)
  (modulo (+ (* 28433 (expt2-last10 7830457)) 1) 10000000000))

(print (p97))
