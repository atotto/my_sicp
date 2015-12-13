(use gauche.test)
(use math.const)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.35

;; Fixed points

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(test* "ex 1.35 fixed-point cos 1.0" 0.7390822985224023 (fixed-point cos 1.0) (expect-delta 1e-5))

(define (golden-ratio p)
  (fixed-point (lambda (p) (+ 1 (/ 1 p))) 1.0))

(test* "ex 1.35 fixed-point golden ratio 1.0" 1.6180327868852458 (fixed-point (lambda (p) (+ 1 (/ 1 p))) 1.0) (expect-delta 1e-5))
(test* "ex 1.35 fixed-point golden ratio 10.0" 1.6180327868852458 (fixed-point (lambda (p) (+ 1 (/ 1 p))) 10.0) (expect-delta 1e-5))
(test* "ex 1.35 fixed-point golden ratio -10.0" 1.6180327868852458 (fixed-point (lambda (p) (+ 1 (/ 1 p))) -10.0) (expect-delta 1e-5))

(test-end :exit-on-failure #t)
