(use gauche.test)
(test-start "ch1")

;;EXERCISE 1.2
(test* "ex 1.2" (- (/ 37 150)) (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))

;;EXERCISE 1.3
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a b c)
  (cond ((and (< a b) (< a c)) (sum-of-squares b c))
        ((and (< b a) (< b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))
))

(test* "ex 1.3" 25 (f 3 4 1))
(test* "ex 1.3" 13 (f 1 2 3))
(test* "ex 1.3" 41 (f 4 2 5))
(test* "ex 1.3" 8 (f 2 2 2))

;;EXERCISE 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(test* "ex 1.4" 3 (a-plus-abs-b 1 2))
(test* "ex 1.4" 3 (a-plus-abs-b 1 -2))
(test* "ex 1.4" 1 (a-plus-abs-b -1 2))


(test-end :exit-on-failure #t)
