(use gauche.test)
(test-start "ch1")

(define (square x) (* x x))

(define (sqrt-iter guess x)
;  (display guess)
;  (display "\n")
  (let ((next_guess (improve guess x)))
  (if (good-enough? next_guess guess)
      guess
      (sqrt-iter next_guess
                 x))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- 1.0 (/ guess old))) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(test* "ex 1.7" 0.006324555320336759 (sqrt 0.00004))

(test-end :exit-on-failure #t)
