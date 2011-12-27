
(define (hexagonal n)
  (* n (- (* 2 n) 1)))

(define (pentagonal? x)
  (integer? (/ (+ 1 (sqrt (+ 1 (* 24 x)))) 6)))

(define (p45)
  (let loop ((i 0)
             (result '()))
    (if (= (length result) 3)
      result
      (loop (+ i 1)
            (if (pentagonal? (hexagonal i))
              (cons (hexagonal i) result)
              result)))))

(print (p45))
