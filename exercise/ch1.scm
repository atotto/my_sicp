;;EXERCISE 1.2
;; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;;EXERCISE 1.3
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= c a) (<= c b)) (sum-of-squares a b))
        (else (sum-of-squares a b))
))

;; (f 5 4 3)
;; (f 1 2 3)
