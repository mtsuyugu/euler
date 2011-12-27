;(use srfi-1)

(define maxnum 9999999999999)

; return vector of vector
(define (input-file fname)
  (call-with-input-file 
    fname 
    (lambda (p)
      (let loop ((r '()))
        (let1 line (read-line p)
              (if (eof-object? line)
                (list->vector (reverse r))
                (loop (cons ((compose list->vector (map$ string->number))
                             (string-split line #\,))
                            r))))))))

(define (vector2d-at v i j)
  (let1 vi (vector-ref v i #f)
        (if vi (vector-ref vi j maxnum) maxnum)))

(define (vector2d-set! v i j obj)
  (let1 vi (vector-ref v i #f)
        (if vi (vector-set! vi j obj) #f)))

(define (p81)
  (let* ((h 80) (w 80) (v (input-file "p81_data.txt")))
    (let loop ((i 0) (j 1))
      (cond ((> i h)
             (vector2d-at v (- w 1) (- h 1)))
            (else
              (vector2d-set! v i j (+ (vector2d-at v i j)
                                      (min (vector2d-at v (- i 1) j)
                                           (vector2d-at v i (- j 1)))))
              (loop (if (= j (- w 1)) (+ i 1) i)
                    (if (= j (- w 1)) 0 (+ j 1))))))))

(print (p81))
