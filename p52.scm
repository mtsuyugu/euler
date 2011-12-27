(use srfi-1)
(use util.stream)

(define integer
  (stream-cons 1 (stream-map (pa$ + 1) integer)))

(define (digits n)
  (let loop ((n n) (r '()))
    (if (= n 0) (sort r)
      (loop (quotient n 10) (cons (modulo n 10) r)))))

(define (same-digits? n)
  (apply list= (cons eq? (map (compose digits (pa$ * n)) (iota 6 1)))))

(define (p52)
  (stream-find same-digits? (stream-cdr integer)))

(print (p52))

