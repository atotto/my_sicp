(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.22
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
(search-for-primes 10000 10038)
(search-for-primes 100000 100044)
(search-for-primes 1000000 1000038)
(newline)

;; note the time
;10007 *** 15
;10009 *** 13
;10037 *** 13
;100003 *** 40
;100019 *** 41
;100043 *** 40
;1000003 *** 126
;1000033 *** 127
;1000037 *** 127

(test-end :exit-on-failure #t)
