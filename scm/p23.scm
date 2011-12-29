(use srfi-1)
(use gauche.sequence)
(load "./util.scm")

(define (abundant? x)
  (> (fold + 0 (divisors x)) x))

(define (p23)
  (let* ((limit 28123)
         (table (make-vector limit #t)))
    (let loop ((i 12) (abundant-list '()))
      (if (>= i limit)
        (fold-with-index (lambda (idx n r)
                           (if (vector-ref table idx)
                             (+ idx r)
                             r))
                         0 table)
        (let* ((isabundant (abundant? i))
               (abundant-list (if isabundant 
                                (cons i abundant-list)
                                abundant-list)))
          (if isabundant
            (for-each (lambda (ab)
                        (if (< (+ ab i) limit)
                          (vector-set! table (+ ab i) #f)))
                      abundant-list))
          (loop (+ i 1) abundant-list))))))


(print (p23))

