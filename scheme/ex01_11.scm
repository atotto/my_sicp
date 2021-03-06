(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.11
(define (f n) 
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))
                 ))))

(test* "ex 1.11" 1 (f 1))
(test* "ex 1.11" 2 (f 2))
(test* "ex 1.11" 4 (f 3))
(test* "ex 1.11" 11 (f 4))
(test* "ex 1.11" 25 (f 5))
(test* "ex 1.11" 59 (f 6))

(define (f n) 
  (define (fn n1 n2 n3) (+ n1 (* 2 n2) (* 3 n3)))
  (define (f-iter count n1 n2 n3) 
    (if (= count n)
        n3
        (f-iter (+ count 1) (fn n1 n2 n3) n1 n2)))
  (f-iter 0 2 1 0))

(test* "ex 1.11" 1 (f 1))
(test* "ex 1.11" 2 (f 2))
(test* "ex 1.11" 4 (f 3))
(test* "ex 1.11" 11 (f 4))
(test* "ex 1.11" 25 (f 5))
(test* "ex 1.11" 59 (f 6))

(define (f n) 
  (define (fn n1 n2 n3) (+ n1 (* 2 n2) (* 3 n3)))
  (define (f-iter count n1 n2 n3) 
    (if (= count 0)
        n3
        (f-iter (- count 1) (fn n1 n2 n3) n1 n2)))
  (f-iter n 2 1 0))

(test* "ex 1.11" 1 (f 1))
(test* "ex 1.11" 2 (f 2))
(test* "ex 1.11" 4 (f 3))
(test* "ex 1.11" 11 (f 4))
(test* "ex 1.11" 25 (f 5))
(test* "ex 1.11" 59 (f 6))

(test-end :exit-on-failure #t)
