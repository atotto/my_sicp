(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.25

;; for gauche
(use srfi-27)
(define true #t)
(define false #f)
(define (random i) (random-integer i))

;; modified expmod
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

;; fast-prime?
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; test
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; for gauche
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

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

;; search-for-primes
(define (search-for-primes a b)
  (define (iter a b)
    (if (< a b)
        (and (if (prime? a)
                 (timed-prime-test a))
             (iter (+ a 1) b))))
  (iter a b))

;; find the three smallest primes
; this test take long time, let's skip
;(search-for-primes 1000 1020)
;(search-for-primes 10000 10038)
;(search-for-primes 100000 100044)
;(search-for-primes 1000000 1000038)
;(search-for-primes 10000000 10000104)
;(newline)

(test-end :exit-on-failure #t)
