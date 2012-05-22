(use srfi-13)

(define (p145)
  (letrec ((maxnum 1000000000)
           (iter (lambda (i c)
                   (if (>= i maxnum)
                     c
                     (let* ((str-i (number->string i))
                            (h (digit->integer (string-ref str-i 0))))
                       (if (not (= (modulo h 2) 0))
                         (iter (+ (* (+ h 1) (expt 10 (- (string-length str-i) 1))) 1) c)
                         (let* ((r (string->number (string-reverse str-i)))
                                (sum (+ r i)))
                           (iter (+ i 2) (if (#/[02468]/ (number->string sum))
                                           c
                                           (+ c 2))))))))))
    (iter 11 0)))

(print (p145))

