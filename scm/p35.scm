(load "./eratosthenes.scm")

(define (prime-circular n)
  (let* ((orgstr (number->string n))
         (chars (string->list orgstr))
         (len (length chars)))
    (let loop ((i 0) (char-list chars) (result '()))
      (if (>= i len)
        result
        (let ((num (string->number (list->string char-list))))
          (if (not (prime? num))
            '()
            (loop (+ i 1)
                  (append (cdr char-list) (list (car char-list)))
                  (cons num result))))))))

(define (p35)
  (let* ((N 1000000)
         (table (make-vector (+ N 1) #t))
         (circula-list (lambda (i)
                   (fold (lambda (c r)
                           (if (vector-ref table c)
                             (begin 
                               (vector-set! table c #f)
                               (cons c r))
                             r))
                         '()
                         (prime-circular i)))))
    (eratosthenes N)
    (let loop ((i 2) (result '()))
      (if (> i N)
        (length result)
        (loop (+ i 1)
              (if (and (prime? i) (vector-ref table i))
                (append result (circula-list i))
                result))))))

      
(time
(print (p35))
)

