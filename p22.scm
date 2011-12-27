(use gauche.sequence)
(use srfi-13)

(define (p22)
  (define (alpha->integer c)
    (- (char->integer c)
       (char->integer #\A)
       -1))
  (define (name->num name)
    (fold (lambda (x y) (+ y (alpha->integer x))) 0 (string->list name)))
  (define (fold-prod idx name num)
    (+ num (* (+ idx 1) (name->num name))))
  (let* ((in (open-input-file "names.txt"))
         (line (read-line in)))
    (close-input-port in)
    (fold-with-index fold-prod 0 (remove string-null? (sort (string-split line #/"?,?"/))))))

(print (p22))

