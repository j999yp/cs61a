(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (define (cons_func rest)
    (cons first rest)
  )
  (map cons_func rests)
  )

(define (sum lst)
  (if (null? lst)
    0
    (+ (car lst) (sum (cdr lst)))
  )
)

(define (zip pairs)
    (list (map car pairs) (map (lambda (x) (car(cdr x))) pairs))
)

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (enumerate_func 0 s)
  )
  ; END PROBLEM 16
(define (enumerate_func cnt s)
  (if(null? s)
    nil
    (cons (list cnt (car s)) (enumerate_func (+ cnt 1) (cdr s)))
  )
)

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 17
    (if (= total 0)
        (list nil)
        (if (null? denoms)
            nil
            (if(>= total (car denoms))
                (append
                    (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
                    (list-change total (cdr denoms))
                )
                (list-change total (cdr denoms))
            )
        )
    )
)
  ; END PROBLEM 17

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (cons form (cons params (let-to-lambda body)))
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (cons 
                (list 'lambda 
                    (car (zip (map let-to-lambda values)));variables
                    (car (map let-to-lambda body)));expression
                (car (cdr (zip (map let-to-lambda values)))));value
           ; END PROBLEM 18
           ))
        (else
         ; BEGIN PROBLEM 18
         (map let-to-lambda expr)
         ; END PROBLEM 18
         )))