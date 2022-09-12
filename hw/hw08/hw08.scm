(define (rle s)
  (define (func cnt s last)
    (if (null? s)
      (cons-stream `(,last ,cnt) nil)
      (if (equal? (car s) last)
        (func (+ cnt 1) (cdr-stream s) (car s))
        (cons-stream `(,last ,cnt) (func 1 (cdr-stream s) (car s)))
      )
    )
  )
  (if (null? s)
    nil
    (func 1 (cdr-stream s) (car s))
  )
)



(define (group-by-nondecreasing s)
  (define (func old new last)
    (if (null? old)
      (cons-stream new nil)
      (if (>= (car old) last)
        (func (cdr-stream old) (append new `(,(car old))) (car old))
        (cons-stream new (func (cdr-stream old) `(,(car old)) (car old)))
      )
    )
  )
  (if (null? s)
    nil
    (func (cdr-stream s) `(,(car s)) (car s))
  )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

