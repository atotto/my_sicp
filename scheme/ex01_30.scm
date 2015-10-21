(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.30

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

;: (sum-cubes 1 10)
(test* "ex 1.30" 3025 (sum-cubes 1 10))

(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;: (sum-integers 1 10)
(test* "ex 1.30" 55 (sum-integers 1 10))

; solution
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(test* "ex 1.30" 3025 (sum-cubes 1 10))
(test* "ex 1.30" 55 (sum-integers 1 10))

(test-end :exit-on-failure #t)
