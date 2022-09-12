(define (split-at lst n)
  (define (func first second n)
    (if (null? second)
      (cons first second)
      (if (= 0 n)
        (cons first second)
        (func (append first `(,(car second))) (cdr second) (- n 1))
      )
    )
  )
  (func nil lst n)
)

(define a 'a)
(define b 'b)

(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons `(equal? ,expr ,(car case)) (cdr case)))
    			cases))
)