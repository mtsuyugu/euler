(use srfi-1)
(use srfi-13)

(define (palindromic? num radix)
  (let1 str (number->string num radix)
        (string=? str (string-reverse str))))

(define (palindromic2and10? num)
  (and (palindromic? num 10) (palindromic? num 2)))

(define (p36)
  (apply + (filter palindromic2and10? (iota 1000000))))

(print (p36))

