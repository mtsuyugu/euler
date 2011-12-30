(use gauche.sequence)
(load "./eratosthenes.scm")


(define N 1000000)
(define (p50 n)
  (eratosthenes n)
  (let ((prime-list (fold-with-index (lambda (idx n r)
                                       (if n (cons idx r) r))
                                     '()
                                     prime-table))
        (sum-of-consecutive-primes (lambda (plist)
                                    (let loop ((p plist)
                                               (total 0)
                                               (total-list '())
                                               (answer-sum 0)
                                               (answer-list '()))
                                      (let1 next (+ (car p) total)
                                            (if (or (> next n)
                                                    (null? (cdr p)))
                                              answer-list
                                              (let ((answer-update? (and (prime? next) (> next total)))
                                                    (new-total-list (cons (car p) total-list)))
                                                    (loop (cdr p)
                                                          next
                                                          new-total-list
                                                          (if answer-update? next total)
                                                          (if answer-update? new-total-list answer-list)))))))))
    (let loop ((plist (reverse (cdr prime-list))) (answer '()))
      (if (null? plist)
        (list (length answer) (apply + answer))
        (let ((result (sum-of-consecutive-primes plist)))
          (loop (cdr plist)
                (if (> (length result) (length answer))
                  result
                  answer)))))))

(print (p50 N))
