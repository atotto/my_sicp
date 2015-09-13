(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.21
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

(test* "ex 1.21" 199  (smallest-divisor 199))
(test* "ex 1.21" 1999 (smallest-divisor 1999))
(test* "ex 1.21" 7    (smallest-divisor 19999))

; 199 and 1999 is prime.

(test-end :exit-on-failure #t)
