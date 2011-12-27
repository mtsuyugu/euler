(use srfi-1)

(define kinds (list 200 100 50 20 10 5 2 1))

(define (f k n)
  (let ((found (member k kinds)))
    (cond ((= k 1) 1)
          (found (let ((k1 (cadr found)))
                   (fold (lambda (x p)
                           (+ (F k1 (- n (* k x))) p))
                         0
                         (iota (quotient n k) 1))))
          (else 0))))

(define (F k n)
  (fold (lambda (x p) (+ (f x n) p)) 0 (member k kinds)))

(define (p31) (F 200 200))

(print (p31))
