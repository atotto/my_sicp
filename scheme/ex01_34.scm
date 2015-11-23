(use gauche.test)
(use math.const)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.34

(define (f g)
  (g 2))


(test* "ex 1.34_f" 4 (f square))
(test* "ex 1.34_f" 6 (f (lambda (z) (* z (+ z 1)))))
;(test* "ex 1.34_f_f" 1 (f f)) ; "invalid application: (2 2)"

(test-end :exit-on-failure #t)
