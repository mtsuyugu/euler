
(define (get-length n)
  (define table 
    (list (cons 0 0)
          (cons 1 (string-length "one"))
          (cons 2 (string-length "two"))
          (cons 3 (string-length "three"))
          (cons 4 (string-length "four"))
          (cons 5 (string-length "five"))
          (cons 6 (string-length "six"))
          (cons 7 (string-length "seven"))
          (cons 8 (string-length "eight"))
          (cons 9 (string-length "nine"))
          (cons 10 (string-length "ten"))
          (cons 11 (string-length "eleven"))
          (cons 12 (string-length "twelve"))
          (cons 13 (string-length "thirteen"))
          (cons 14 (string-length "fourteen"))
          (cons 15 (string-length "fifteen"))
          (cons 16 (string-length "sixteen")) 
          (cons 17 (string-length "seventeen"))
          (cons 18 (string-length "eighteen"))
          (cons 19 (string-length "nineteen"))
          (cons 20 (string-length "twenty"))
          (cons 30 (string-length "thirty"))
          (cons 40 (string-length "forty"))
          (cons 50 (string-length "fifty"))
          (cons 60 (string-length "sixty"))
          (cons 70 (string-length "seventy"))
          (cons 80 (string-length "eighty"))
          (cons 90 (string-length "ninety"))
          (cons 100 (string-length "hundred"))
          (cons 1000 (string-length "onethousand"))))
  (cdr (assoc n table)))

(define (p17)
  (let loop ((i 1)
             (result 0))
    (if (= i 1000) (+ result (get-length i))
      (loop (+ i 1)
            (+ result
               (let* ((k100 (quotient i 100)) ;; 100 の桁
                      (k10 (quotient (modulo i 100) 10)) ;; 10 の桁
                      (k1 (modulo i 10))) ;; 1 の桁
                 (+ ;; 100 の桁の文字数
                   
                   (if (= k100 0) 0 (+ (get-length k100)(get-length 100) ; hundred
                     (if (and (= k10 0) (= k1 0)) 0 (string-length "and"))))
                    ;; 下二桁
                    (if (= k10 1) (get-length (+ (* k10 10) k1)) ;; 10 台
                      (+ (get-length (* k10 10)) 
                         (get-length k1))))))))))

(print (p17))

                 
