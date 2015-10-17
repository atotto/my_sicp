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

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (next n) (+ n 2))
  (* (+ (y 0)
        (* (sum y 2 next (- n 1)) 2.0)
        (* (sum y 1 next (- n 1)) 4.0)
        (y n))
     (/ h 3.0)))
  
(test* "ex 1.29" 0.25 (simpson cube 0 1 100))

(test-end :exit-on-failure #t)
