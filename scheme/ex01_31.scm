(use gauche.test)
(add-load-path "." :relative)
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

(test* "ex 1.31" 24 (factorial 4))
(test* "ex 1.31" 120 (factorial 5))

(test-end :exit-on-failure #t)
