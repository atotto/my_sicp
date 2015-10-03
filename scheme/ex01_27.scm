(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.27

;; for gauche
(use srfi-27)
(define true #t)
(define false #f)
(define (random i) (random-integer i))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; Carmichael numbers
(test* "ex 1.27" true (fermat-test 561))
(test* "ex 1.27" true (fermat-test 1105))
(test* "ex 1.27" true (fermat-test 1729))
(test* "ex 1.27" true (fermat-test 2465))
(test* "ex 1.27" true (fermat-test 2821))
(test* "ex 1.27" true (fermat-test 6601))

(test-end :exit-on-failure #t)
