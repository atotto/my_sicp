(use gauche.test)
(test-start "ch1")

;;EXERCISE 1.2
(test* "ex 1.2" (- (/ 37 150)) (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))

;;EXERCISE 1.3
(define (square x) (* x x))
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

;;EXECISE 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; (test 0 (p)) ; this line hang up, so gosh is applicative-order evaluation (適用順序評価)

;;EXECISE 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;: (sqrt 9) ; this line hang up.

(test-end :exit-on-failure #t)
