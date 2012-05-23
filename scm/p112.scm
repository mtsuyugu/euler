(define (p112)
  (letrec ((ratio 0.99)
           (is-bouncy (lambda (n)
                        (letrec ((is-bouncy-iter (lambda (n last dir)
                                                   (if (= n 0)
                                                     #f
                                                     (let ((i (modulo n 10))
                                                           (is-dir-0 (= dir 0)))
                                                       (if (and (not is-dir-0) ((if (< dir 0) > <) i last))
                                                         #t
                                                         (is-bouncy-iter (quotient n 10) i
                                                                         (if is-dir-0 (- i last) dir))))))))
                          (is-bouncy-iter (quotient n 10) (modulo n 10) 0))))
;           (iter2 (lambda (n count maxn)
;                    (if (>= n maxn)
;                      count
;                      (iter2 (+ n 1)
;                           (if (is-bouncy n) (+ count 1) count)
;                           maxn))))
           (iter (lambda (n count)
                   (if (not (is-bouncy n))
                     (iter (+ n 1) count)
                     (begin
                       (print (list n (+ count 1) (/. (+ count 1) n)))
                       (if (>= (/ (+ count 1) n) ratio)
                         n
                         (iter (+ n 1) (+ count 1))))))))
;    (iter2 100 0 1000)))
   (iter 100 0)))


(print (p112))

