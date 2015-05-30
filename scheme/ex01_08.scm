(use gauche.test)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXECISE 1.8
(define (cbrt-iter guess x)
  (let ((next_guess (improve guess x)))
  (if (good-enough? next_guess guess)
      guess
      (cbrt-iter next_guess
                 x))))

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? guess old)
  (< (abs (- 1.0 (/ guess old))) 1e-5))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(test* "ex 1.8" 1.259921049894873 (cbrt 2.0) (expect-delta 1e-5))

(test-end :exit-on-failure #t)
