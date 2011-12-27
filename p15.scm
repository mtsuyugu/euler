(use gauche.sequence)
(use gauche.collection)

(define (gen-grid)
  (let1 grid (make-vector 21 0)
        (let loop ((i 0))
          (unless (= i 21)
            (set! (ref grid i) (make-vector 21 (if (= i 0) 1 0)))
            (loop (+ i 1))))
        (for-each (lambda (x) (set! (ref x 0) 1)) grid)
        grid))

(define (grid-at grid i j)
  (ref (ref grid i) j))

(define (grid-at! grid i j n)
  (set! (ref (ref grid i) j) n))

(define (p15 grid)
  (let loop ((i 1)
             (j 1))
    (cond ((= i 21) (grid-at grid 20 20))
          (else (grid-at! grid i j (+ (grid-at grid (- i 1) j)
                                      (grid-at grid i (- j 1))))
                (loop (if (= j 20) (+ i 1) i)
                      (if (= j 20) 1 (+ j 1)))))))

(print (p15 (gen-grid)))

