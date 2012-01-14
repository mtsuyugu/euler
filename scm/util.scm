(define sum (cut apply + <>))
(define % (lambda (x y) (= (modulo x y) 0)))

; (char-sort "3421") -> "1234"
(define (char-sort str) (list->string (sort (string->list str))))

; (digit-sort 3421) -> 1234
(define (digit-sort num) (string->number (char-sort (number->string num))))

; (digit-append 1 2 3) -> 123
(define digit-append (lambda x (apply string-append (map number->string x))))

(define (pandigital? str) (and (= (string-length str) 9)
                               (equal? (char-sort str) "123456789")))

(define (n-pandigital? num)
  (define answer-list (list "1" "12" "123" "1234" "12345" "123456" "1234567" "12345678" "123456789"))
  (let* ((str (number->string num))
         (keta (string-length str)))
    (and (< keta 10)
         (equal? (char-sort str) (list-ref answer-list (- keta 1))))))

(define (divisors x)
  (let ((limit (sqrt x)))
    (let loop ((i 2) (result '(1)))
      (if (> i limit)
        result
        (let* ((qm (call-with-values (lambda () (quotient&remainder x i)) cons))
               (q (car qm))
               (m (cdr qm)))
          (loop (+ i 1)
                (cond ((not (= m 0)) result)
                      ((= q i) (cons i result))
                      (else (list* q i result)))))))))

(define (prime-by-divide? n)
  (cond ((or (= n 2) (= n 3)) #t)
        ((or (< n 2) (% n 2) (% n 3)) #f)
        (else (let ((limit (sqrt n)))
                (let loop ((x 5) (d 2))
                  (cond ((> x limit) #t)
                        ((% n x) #f)
                        (else (loop (+ x d) (if (= d 2) 4 2)))))))))

