(use gauche.test)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXECISE 1.7
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

(define (good-enough? guess old)
  (< (abs (- 1.0 (/ guess old))) 1e-5))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(test* "ex 1.7" 0.006324555320336759 (sqrt 0.00004) (expect-delta 1e-5))
(test* "ex 1.7" 31.622776601683793 (sqrt 1000.0) (expect-delta 1e-5))

(test-end :exit-on-failure #t)
