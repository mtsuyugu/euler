(use srfi-1)

; permutation
(define (p n r)
  (apply * (iota r n -1)))

; combination
(define (c n r)
  (/ (p n r) (p r r)))

(define (p53)
  (fold (lambda (n p)
          (+ p (count (pa$ < 1000000) 
                      (map (pa$ c n) (iota n 1)))))
        0 (iota 100 1)))

(print (p53))
