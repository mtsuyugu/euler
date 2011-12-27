(use gauche.sequence)

(define tri (list->vector (reverse (list 
(list->vector (list 75))
(list->vector (list 95 64))
(list->vector (list 17 47 82))
(list->vector (list 18 35 87 10))
(list->vector (list 20 04 82 47 65))
(list->vector (list 19 01 23 75 03 34))
(list->vector (list 88 02 77 73 07 63 67))
(list->vector (list 99 65 04 28 06 16 70 92))
(list->vector (list 41 41 26 56 83 40 80 70 33))
(list->vector (list 41 48 72 33 47 32 37 16 94 29))
(list->vector (list 53 71 44 65 25 43 91 52 97 51 14))
(list->vector (list 70 11 33 28 77 73 17 78 39 68 17 57))
(list->vector (list 91 71 52 38 17 14 91 43 58 50 27 29 48))
(list->vector (list 63 66 04 68 89 53 67 30 73 16 69 87 40 31))
(list->vector (list 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23))))))

(define (p17 tri)
  (let loop ((i 1))
    (let1 veci (ref tri i #f)
          (if (eq? veci #f)
            (ref (ref tri (- (vector-length tri) 1)) 0)
            (let1 veci-1 (ref tri (- i 1))
                  (vector-set! tri i (list->vector (map-with-index
                                                     (lambda (n x) (+ x (max (ref veci-1 n)
                                                                             (ref veci-1 (+ n 1)))))
                                                     veci)))
                (loop (+ i 1)))))))

          
(print (p17 tri))
