(use gauche.test)
(use math.const)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.31

(define (identity x) x)

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (factorial n)
  (accumulate * 1 identity 1 inc n))

(define (sum-integers a b)
  (accumulate + 0 identity 1 inc b))

(define (sum-cubes a b)
  (accumulate + 0 cube a inc b))

;;recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(test* "ex 1.32_factorial" 24 (factorial 4))
(test* "ex 1.32_factorial" 120 (factorial 5))
(test* "ex 1.32_sum-integers" 55 (sum-integers 1 10))
(test* "ex 1.32_sum-cube" 3025 (sum-cubes 1 10))

;;iterative process
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(test* "ex 1.31_factorial" 24 (factorial 4))
(test* "ex 1.31_factorial" 120 (factorial 5))
(test* "ex 1.32_sum-integers" 55 (sum-integers 1 10))
(test* "ex 1.32_sum-cube" 3025 (sum-cubes 1 10))

(test-end :exit-on-failure #t)
