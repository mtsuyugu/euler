(use srfi-1)

; this program results in out of memory....

(define (frac x)
  (delete-duplicates
  (sort 
    (fold (lambda (x p) 
            (format (current-error-port) "~s\n" x)
         (append (map (lambda (y) (/ y x)) (iota (- x 1) 1)) p))
        '()
        (iota (- x 1) 2)))))

(define (find l)
  (let loop ((l l) (p 0))
    (cond ((null? l) #f)
          ((= (car l) (/ 3 7)) p)
          (else (loop (cdr l) (car l))))))

(define (p71)
  (find (frac 1000000)))
      
