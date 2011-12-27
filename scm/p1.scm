(use srfi-1)
(load "./util.scm")

(define (p1)
  (apply + (filter (lambda (x) (or (% x 3) (% x 5)))
                   (iota 999 1))))

