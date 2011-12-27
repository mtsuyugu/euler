(use srfi-1)
(use util.combinations)

(define (p29)
  (let1 list2to100 (list-tabulate 99 (lambda (x) (+ x 2)))
        (length (delete-duplicates (map (lambda (x) (expt (car x) (cadr x)))
                                        (cartesian-product (make-list 2 list2to100)))))))

(print (p29))
