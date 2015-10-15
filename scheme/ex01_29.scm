(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

;; see https://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%B3%E3%83%97%E3%82%BD%E3%83%B3%E3%81%AE%E5%85%AC%E5%BC%8F
;; :<math>\int_a^b f(x) \, dx\approx 
;; \frac{h}{3}\bigg[f(x_0)+2\sum_{j=1}^{n/2-1}f(x_{2j})+
;; 4\sum_{j=1}^{n/2}f(x_{2j-1})+f(x_n)
;; \bigg]</math>

(define (inc2 n) (+ n 2))

(define (h a b n)
  (/ (- b a) n))

(test* "ex 1.29 h" (/ 1 100) (h 0 1 100))

(define (y f a k h)
  (f (+ a (* k h))))

(test* "ex 1.29 y" 0.0 (y cube 0   0 0.01))
(test* "ex 1.29 y" 1.0 (y cube 0 100 0.01))
;(test* "ex 1.29 y" (cube (/ 21 100.0)) (y cube 0  21 0.01))

(define (simpson f a b n)
  (define (rule f a b n h)
    (* (+ (y f a 0 h)
          (* (sum f 0 inc2 (- n 1)) 2.0)
          (* (sum f 1 inc2 (- n 1)) 4.0)
          (y f a n h))
       (/ h 3.0)))
  (rule f a b n (h a b n)))

(test* "ex 1.29" 0.25 (simpson cube 0 1 100))

(test-end :exit-on-failure #t)
