(use gauche.test)
(add-load-path "." :relative)
(use testutil)
(test-start "ch1")

;;EXERCISE 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;: (A 1 10)
;1024

;: (A 2 4)
;65536

;: (A 3 3)
;65536

(define (f n) (A 0 n))
(define (f n) (* 2 n))

(test* "ex 1.10" 2 (f 1))
(test* "ex 1.10" 4 (f 2))
(test* "ex 1.10" 6 (f 3))
(test* "ex 1.10" 8 (f 4))

(define (g n) (A 1 n))
(define (g n) (expt 2 n))

(test* "ex 1.10" 2 (g 1))
(test* "ex 1.10" 4 (g 2))
(test* "ex 1.10" 8 (g 3))
(test* "ex 1.10" 16 (g 4))
(test* "ex 1.10" 32 (g 5))

(define (h n) (A 2 n))
;(define (h n) (A 1 (A 2 (- n 1))))
;(define (h n) (A 1 (A 1 (A 2 (- n 2)))))
;(define (h n) (A 1 (A 1 (A 1 (A 2 (- n 3))))))
; :
;(define (h n) (A 1 (A 1 (A 1 ... (A 2 (- n n))))))
;
;(define (h n) (g (g (g ... (A 2 (1))))))
;(define (h n) (g (g (g ... (A 2 1)))))
;(define (h n) (g (g (g ... (2)))))

;(define (h n) (g (g n)))
(define (h n) (g (h (- n 1))))

(define (h n)
  (if (= n 1) 
      2
      (g (h (- n 1)))))

(test* "ex 1.10" 2 (h 1))
(test* "ex 1.10" 4 (h 2))
(test* "ex 1.10" 16 (h 3))
(test* "ex 1.10" 65536 (h 4))

(define (k n) (* 5 n n))




(test-end :exit-on-failure #t)
