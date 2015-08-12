(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.19
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(test* "ex 1.19" 1  (fib 1))
(test* "ex 1.19" 1  (fib 2))
(test* "ex 1.19" 2  (fib 3))
(test* "ex 1.19" 3  (fib 4))
(test* "ex 1.19" 55 (fib 10))

;0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
(test-end :exit-on-failure #t)
