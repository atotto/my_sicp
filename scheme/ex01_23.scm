(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.23
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(test* "ex 1.23 next" 3 (next 1))
(test* "ex 1.23 next" 3 (next 2))
(test* "ex 1.23 next" 5 (next 3))
(test* "ex 1.23 next" 6 (next 4))

;; fixed version

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
        (else (find-divisor n (next test-divisor)))))

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
(search-for-primes 10000 10038)
(search-for-primes 100000 100044)
(search-for-primes 1000000 1000038)
(newline)

;; note the time
;10007 *** 12
;10009 *** 10
;10037 *** 10
;100003 *** 30
;100019 *** 31
;100043 *** 31
;1000003 *** 98
;1000033 *** 98
;1000037 *** 99

(test-end :exit-on-failure #t)
