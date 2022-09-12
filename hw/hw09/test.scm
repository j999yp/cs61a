(define (reverse lst)
    (if (null? lst)
        nil
        (append (reverse (cdr lst)) `(,(car lst)))
    )
)

(reverse '(1))