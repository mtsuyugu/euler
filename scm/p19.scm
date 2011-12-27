(use srfi-19)

(define (get-wday d m y)
  (date-week-day (make-date 0 0 0 0 d m y (date-zone-offset (current-date)))))

(define (p19)
  (let loop ((y 1901)
             (m 1)
             (result 0))
    (if (= y 2001) result
      (loop (+ y (if (= m 12) 1 0))
            (+ 1 (if (= m 12) 0 m))
            (+ result (if (= (get-wday 1 m y) 0) 1 0))))))

(print (p19))

