
(use srfi-1)

(define (p3 n) (/ (* n (+ n 1)) 2))
(define (p4 n) (* n n))
(define (p5 n) (/ (* n (- (* 3 n) 1)) 2))
(define (p6 n) (* n (- (* 2 n) 1)))
(define (p7 n) (/ (* n (- (* 5 n) 3)) 2))
(define (p8 n) (* n (- (* 3 n) 2)))


(define (generate-values) 
  (let ((subs (list 0 0 0 p3 p4 p5 p6 p7 p8)))
    (fold (lambda (P generated-list) 
            (let1 value-list (let loop ((i 1)
                                        (result '()))
                               (let1 k ((list-ref subs P) i)
                                     (cond ((< k 1000) (loop (+ i 1) result))
                                           ((> k 9999) result)
                                           (else (let* ((first2 (quotient k 100))
                                                        (already (assq first2 result)))
                                                   (loop (+ i 1)
                                                         (if already 
                                                           (assoc-set! result first2 (append (cdr already) (list k)))
                                                           (acons first2 (list k) result))))))))
                  (acons P value-list generated-list)))
          '()
          '(3 4 5 6 7 8))))





(define sum (lambda (x) (fold + 0 x)))
(define set-visited (lambda (visited n)
                      (let1 new-visited (list-copy visited)
                            (list-set! new-visited n 1)
                            new-visited)))

(define (debug v found visited last2)
  (print v " " found visited last2))

(define (find-list-with-prefix prefix n value-list)
  (let1 found (assq prefix (cdr (assq n value-list)))
        (if found (cdr found) #f)))

(define (search found visited last2 value-list)
  (let ((v (sum visited)))
;   (debug v found visited last2)
    (if (and (= v 6) (= (quotient (car found) 100) last2))
      found
      (any (lambda (x) 
             (cond ((= (list-ref visited x) 1) #f)
                   ((not (find-list-with-prefix last2 x value-list)) #f)
                   (else (any (lambda (n) 
                                (search (append found (list n))
                                        (set-visited visited x)
                                        (modulo n 100)
                                        value-list))
                              (find-list-with-prefix last2 x value-list)))))
           (list 8 7 6 5 4 3)))))


(define value-list (generate-values))
(define N 8)
(define (p61)
  (let* ((vals (cdr (assq N value-list)))
         (result (any (lambda (x)
                        (let ((digit-list (cdr x)))
                          (any (lambda (n) 
                                 (let ((visited (make-list 9 0)))
                                   (list-set! visited N 1)
                                   (search (list n) visited (modulo n 100) value-list)))
                               digit-list)))
                      vals)))
    (print result)
    (print (sum result))))
  
; 1281 8128 2882 8256 5625 2512
(p61)

