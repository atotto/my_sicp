(use gauche.test)
(use math.const)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.33

(define (identity x) x)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (factorial n)
  (product identity 1 inc n))

(define (sum-integers a b)
  (sum identity 1 inc b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (accumulate combiner null-value term a next b)
  (define (true a) 1)
  (filtered-accumulate true combiner null-value term a next b))

;;iterative process
(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner (term a) result))
            (iter (next a) result))))
  (iter a null-value))

(test* "ex 1.33_factorial" 24 (factorial 4))
(test* "ex 1.33_factorial" 120 (factorial 5))
(test* "ex 1.33_sum-integers" 55 (sum-integers 1 10))
(test* "ex 1.33_sum-cube" 3025 (sum-cubes 1 10))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; a
(define (ex_a a b)
  (filtered-accumulate prime? + 0 square a inc b))

;; b
(define (ex_b n)
  (define (ok? x) (= (gcd x n) 1))
  (filtered-accumulate ok? * 1 identity 1 inc (- n 1)))

(test* "ex 1.33_a" 373 (ex_a 3 13))
(test* "ex 1.33_b" 385 (ex_b 12))

(test-end :exit-on-failure #t)
