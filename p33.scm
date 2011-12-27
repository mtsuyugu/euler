(use srfi-1)
(use util.combinations)


(define (pseudo-cancel n d) ; (12 23) -> (/ 1 3)
  (define (num->digits n) ; 12 -> (1 2)
    (map (cut <> n 10) (list quotient modulo)))
  (define (same-digits? n1 n2) ; (same-digits? 12 23) -> 2
    (let* ((d1 (num->digits n1))
           (d2 (num->digits n2)))
      (any (lambda (x) (if (apply = x) (car x) #f))
           (cartesian-product (list d1 d2)))))
  (define (del-digits n d) ; (del-digits 23 2) -> 3
    (let ((q (quotient n 10))
          (m (modulo n 10)))
      (cond ((= q d) m)
            ((= m d) q)
            (else 0))))
  (let ((found (same-digits? n d)))
        (if found 
          (/ (del-digits n found) (del-digits d found))
          0)))


(define (p33)
  (define (gen-rational)
    (fold (lambda (d p) 
            (append p (map (lambda (n) (list n d)) 
                           (iota (- d 9) 10))))
          '() (iota 90 10)))
  (denominator 
    (apply *
           (filter-map (lambda (num) 
                         (let* ((n (car num))
                                (d (cadr num))
                                (p (pseudo-cancel n d)))
                           (cond ((= n d) #f)
                                 ((every (lambda (x) (= 0 (modulo x 10))) num) #f)
                                 ((= p (apply / num)) p)
                                 (else #f))))
                (gen-rational)))))

