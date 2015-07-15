(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.18

; iter
(define (multi a b)
  (define (double a) 
    (* a 2))
  (define (halve a)
    (/ a 2))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (iter a b e)
    (cond ((= b 0) e)
          ((even? b) (iter (double a) (halve b) e))
          (else (iter (double a) (halve (- b 1)) (+ a e)))))
  (iter a b 0))

(test* "ex 1.18" 2  (multi 1 2))
(test* "ex 1.18" 4  (multi 2 2))
(test* "ex 1.18" 18 (multi 2 9))
(test* "ex 1.18" 42 (multi 6 7))
(test* "ex 1.18" 49 (multi 7 7))

(test-end :exit-on-failure #t)
