(use srfi-1)
(use srfi-13)

(define list9s (append (list 9) (iota 10 90) (iota 100 900) (iota 1000 9000)))
;(define list9s (append (list 9) (iota 10 90)))

(define (char-sort str) (list->string (sort (string->list str))))
(define (pandigital? str) (and (= (string-length str) 9)
                               (equal? (char-sort str) "123456789")))

(define (concat-product num multis)
  (string-concatenate (map (^x (number->string (* num x))) multis)))

(define (p38)
  (fold (lambda (n max2)
          (let1 pandigital (fold (lambda (m max1)
                                   (let* ((candidate (concat-product n (iota (- m 1) 1)))
                                          (candidate-number (string->number candidate)))
                                     (if (and (pandigital? candidate) (> candidate-number (car max1)))
                                       (list candidate-number m)
                                       max1)))
                          (list 0 0)
                          (iota 8 2))
                (if (> (car pandigital) (car max2))
                  (list (car pandigital) (cadr pandigital)  n)
                  max2)))
        (list 0 0 0)
        list9s))

(print (p38))


