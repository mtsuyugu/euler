(use util.combinations)
(load "./eratosthenes.scm")
(load "./util.scm")



(define (p49)
  (eratosthenes 10000)
  (let ((prime-list (prime-list-less-than 10000)))
    (combinations-for-each (lambda (x)
                             (let ((n1 (car x))
                                   (n2 (cadr x)))
                               (if (and (> n1 999)
                                        (> n2 999))
                                 (let1 n3 (+ n2 (- n2 n1))
                                       (if (and (< n3 10000) 
                                                (prime? n3)
                                                (apply = (map digit-sort (list n1 n2 n3))))
                                 (print (digit-append n1 n2 n3)))))))
                           prime-list 2)))

(p49)
