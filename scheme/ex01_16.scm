(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.16

; original
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; apply hint
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (fast-expt (square b) (/ n 2)))
        (else (* b (fast-expt b (- n 1))))))

; iter
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(test* "ex 1.16" 4 (fast-expt 2 2))
(test* "ex 1.16" 8 (fast-expt 2 3))
(test* "ex 1.16" 256 (fast-expt 2 8))
(test* "ex 1.16" 65536 (fast-expt 2 16))

(test-end :exit-on-failure #t)
