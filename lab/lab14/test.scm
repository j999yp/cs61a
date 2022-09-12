(define a 'a)

(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons `(equal? ,expr ,(car case)) (cdr case)))
    			cases))
)
(define x 'b)
(define b 'b)
(switch x ((a (print 1))
            (b (print 2))
            (c (print 3))))