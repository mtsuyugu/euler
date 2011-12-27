(use srfi-1)
(use srfi-13)

(define (palindromic num)
  (string->number (string-reverse (number->string num))))

(define (palindromic? num)
  (let1 str (number->string num)
        (string=? str (string-reverse str))))

(define (lychrel? num)
  (let loop ((i 0)
             (n num))
    (let1 next (+ n (palindromic n))
          (cond ((= i 50) #f)
                ((palindromic? next) #t)
                (else (loop (+ i 1) next))))))

(define (p55)
  (length (remove lychrel? (iota 9999 1))))

(print (p55))

