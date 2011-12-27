(use srfi-1)
(use srfi-13)

(define (read-primes fn)
  (let* ((in (open-input-file fn))
         (primes (read in)))
    (close-input-port in)
    primes))

(define primes (read-primes "primes.txt"))
(define v (let1 v (make-vector 1000000 0)
                (for-each (lambda (x) 
                            (vector-set! v x 1)) primes)
                v))

(define (circular-number num)
  (let* ((strnum (x->string num))
         (len (string-length strnum)))
    (delete-duplicates
      (map (lambda (n) 
             (x->integer (string-append (string-drop strnum n) 
                                        (string-take strnum n)))) 
           (iota len)))))

(define (all-primes? nlist)
  (every (lambda (x) (= (vector-ref v x) 1)) nlist))

(define (p35)
  (length (fold (lambda (x y)
                  (if (all-primes? (circular-number x))
                    (cons x y)
                    y)) '() primes)))

(print
(circular-number 197)
)
(print (p35))
