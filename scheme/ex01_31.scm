(use gauche.test)
(use math.const)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.31

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (factorial n)
  (product identity 1 inc n))

(test* "ex 1.31_factorial" 24 (factorial 4))
(test* "ex 1.31_factorial" 120 (factorial 5))

(define (square x) (* x x))

(define (wallis x)
  (define (term n)
    (/ (square (* 2 n)) (* (- (* 2 n) 1) (+ (* 2 n) 1))))
  (* (product term 1 inc x) 2))

(test* "ex 1.31_wallis" pi (wallis 300) (expect-delta 1e-3))

(test-end :exit-on-failure #t)
