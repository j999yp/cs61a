(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)


(define (sign num)
  (cond 
    ((< num 0) -1)
    ((= num 0) 0)
    (else 1)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (if (= y 1)
    x
    (if(even? y)
      (square (pow x (/ y 2)))
      (* x (square (pow x (/ (- y 1) 2))))
    )
  )
)


(define (unique s)
  (if (null? s)
    nil
    (cons (car s) (unique (filter (lambda (x) (not (eq? (car s) x))) (cdr s))))
  )
)


(define (replicate x n)
  (replicate_func `() n x)
)

(define (replicate_func current_lst n x)
  (if (= n 0)
    current_lst
    (replicate_func (append current_lst (list x)) (- n 1) x)
  )
)


(define (accumulate combiner start n term)
  (if (= n 0)
    start
    (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)


(define (accumulate-tail combiner start n term)
  (accumulate-tail_func combiner n term start)
)

(define (accumulate-tail_func combiner n term res)
  (if (= n 0)
    res
    (accumulate-tail_func combiner (- n 1) term (combiner res (term n)))
  )
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)
