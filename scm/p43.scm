(use srfi-1)
(use util.combinations)
(load "./eratosthenes.scm")
(load "./util.scm")


(define (ddd str n)
  (string->number (substring str (- n 1) (+ n 2))))

(define (has-the-property str)
  (every (lambda (n p)
           (% (ddd str n) p))
         (iota 7 2)
         (list 2 3 5 7 11 13 17)))

(define (p43)
  (let ((result '()))
    (permutations-for-each (lambda (char-list)
                             (let* ((str (list->string char-list))
                                    (n (string->number str)))
                               (if (and (> n 1000000000)
                                        (has-the-property str))
                                   (set! result (cons n result)))))
                                 (list #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))
    (apply + result)))

(print (p43))
