(use gauche.test)
(test-start "ch1")

;;EXERCISE 1.2
(test* "ex 1.2" (- (/ 37 150)) (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))

;;EXERCISE 1.3
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= c a) (<= c b)) (sum-of-squares a b))
        (else (sum-of-squares a c))
))

(test* "ex 1.3" 25 (f 3 4 1))
(test* "ex 1.3" 13 (f 1 2 3))
(test* "ex 1.3" 41 (f 4 2 5))

(test-end :exit-on-failure #t)
