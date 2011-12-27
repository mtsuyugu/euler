
(define (p99)
  (call-with-input-file
    "p99_data.txt"
    (lambda (p)
      (let loop ((tmp '(0 0)) (i 1))
        (let1 line (read-line p)
              (if (eof-object? line)
                (cadr tmp)
                (let1 value (apply (lambda (b e) (* e (log b)))
                                   (map string->number (string-split line #\,)))
                      (loop (if (> (car tmp) value)
                              tmp
                              (list value i))
                            (+ i 1)))))))))

(print (p99))
