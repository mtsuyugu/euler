(use srfi-1)
(use util.combinations)

(define (square x) (* x x))
(define (right-angle? t)
  (= (+ (square (car t))
        (square (cadr t)))
     (square (caddr t))))

(define (lookup n)
  (delete-duplicates
    (filter-map (lambda (t)
                  (let* ((a (car t))
                         (b (cadr t))
                         (c (- n a b))
                         (t (sort (list a b c))))
                    (if (and (> c 0) (right-angle? t))
                      t
                      #f)))
                (cartesian-product (list (iota (- n 1) 1) (iota (- n 1) 1))))))

(define (p39)
  (let loop ((i 3) (r 0) (p 0))
    (if (= i 1000)
      p
      (let* ((found (lookup i))
             (result (length found)))
        (loop (+ i 1) 
              (if (> result r) result r)
              (if (> result r) i p))))))

