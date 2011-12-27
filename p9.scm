
(define (p9)
  (define square (^x (* x x)))
  (let loop ((a 1)
             (b 1))
    (let1 c (- 1000 a b)
          (if (= (+ (square a) (square b)) (square c))
            (* a b c)
            (loop (if (= b 999) (+ a 1) a)
                  (if (= b 999) 1 (+ b 1)))))))

(print (p9))

