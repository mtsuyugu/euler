(use gauche.sequence)
(use srfi-13)


(define (p42)
  (define (alpha->integer c)
    (- (char->integer c)
       (char->integer #\A)
       -1))
  (define (word->num word)
    (fold (lambda (x y) (+ y (alpha->integer x))) 0 (string->list word)))
  (define (is-triangle-number? num)
    (integer? (/ (- (sqrt (+ 1 (* 8 num))) 1) 2)))
  (let* ((in (open-input-file "words.txt"))
         (line (read-line in)))
    (close-input-port in)
    (fold (lambda (s y) 
            (let1 num (word->num s)
                  (+ y (if (is-triangle-number? num) 1 0))))
          0 (remove string-null? (sort (string-split line #/"?,?"/))))))

(print (p42))

