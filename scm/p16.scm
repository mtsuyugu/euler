(use srfi-1)

(define (p16)
  (fold (lambda (x n) (+ (digit->integer x) n))
        0
        (string->list (number->string (expt 2 1000)))))

(print (p16))
