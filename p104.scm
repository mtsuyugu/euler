(use srfi-1)
(use util.stream)

(define (fibgen a b)
  (stream-cons a (fibgen b (+ a b))))

(define fibs (fibgen 1 1))

(define (pandigital? num)
  (list= =
         (iota (ceiling (/ (log num) (log 10))) 1)
         (sort (let loop ((n num)
                          (result '()))
                 (if (= n 0)
                   result
                   (loop (quotient n 10) (cons (modulo n 10) result)))))))


(define (first-9digits num)
  (string->number (substring (number->string num) 0 9)))

(define (last-9digits num)
  (modulo num 1000000000))

(define (p104)
  (let loop ((i 0))
    (let1 n (stream-ref fibs i)
          (if (and (>= n 100000000)
                   (pandigital? (first-9digits n))
                   (pandigital? (last-9digits n)))
              i
          (begin ;(format #t "~s ~s ~s ~s\n" i n (if (>= n 100000000) (first-9digits n) #f)
                 ;        (if (>= n 100000000) (last-9digits n) #f) )
              (loop (+ i 1)))))))

(print (p104))
