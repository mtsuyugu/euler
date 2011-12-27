(use srfi-1)
(use util.combinations)

; '(1 2 3) -> 123
(define (list->number l)
  (let loop ((l l) (r 0))
    (if (null? l)
      r
      (loop (cdr l) (+ (* r 10) (car l))))))

; 123 -> 3
(define (keta n)
  (let loop ((n n) (i 0))
    (if (= n 0) i
      (loop (quotient n 10) (+ i 1)))))

; 1234 1 -> '(123 4), 1234 2 -> '(12 34)
(define (split-2 n i)
  (let1 k (expt 10 i) 
        (list (quotient n k) (modulo n k))))

; 1234 -> '((1 234) (12 34) (123 4)) 
(define (all-splits-2 n)
  (map (lambda (i) (split-2 n i))
       (reverse (iota (- (keta n) 1) 1))))

; 1234 -> '((1 2 34) (1 23 4) (12 3 4))
(define (all-splits-3 n)
  (fold (lambda (i p) 
         (let* ((ns (split-2 n i))
                (n1 (car ns))
                (n2 (all-splits-2 (cadr ns))))
           ;(append p (map (lambda (x) (list n1 (car x) (cadr x))) n2))
           (append p (map (pa$ cons n1) n2))))
        '()
       (reverse (iota (- (keta n) 1) 1))))

; search solutions from pandigital 9-digits number n
(define (find n)
  (filter-map (lambda (x)
                (if (= (* (car x) (cadr x))
                       (caddr x))
                  (caddr x)
                  #f))
            (all-splits-3 n)))

(define (p32)
  (let1 result '()
        (permutations-for-each
          (lambda (x)
             (format (current-error-port) "~s ~s\n" (list->number x) result)
              (set! result (append result (find (list->number x)))))
          (iota 9 1))
        (apply + (delete-duplicates result))))

