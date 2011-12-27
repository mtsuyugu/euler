(use srfi-1)
(use util.toposort)

(define (p79)
  (call-with-input-file
    "p79_dat.txt"
    (lambda (p)
      (let loop ((nodes '()))
        (let1 line (read-line p)
              (if (not (eof-object? line))
                (let* ((nums (string->list line))
                       (key  (car nums))
                       (value (cdr nums))
                       (found (assq key nodes)))
                  (if found 
                    (set-cdr! found (delete-duplicates (append found value)))  ; update
                    (set! nodes (acons key value nodes)))                      ; new
                  (loop nodes))
                (list->string (topological-sort (map cdr nodes)))))))))

(print (p79))
