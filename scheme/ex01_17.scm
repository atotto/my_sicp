(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.17
;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))
;
;(test* "ex 1.17" 2  (* 1 2))
;(test* "ex 1.17" 42 (* 6 7))


(define (multi a b)
  (define (double a) 
    (* a 2))
  (define (halve a)
    (/ a 2))
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (multi (double a) (halve b)))
        (else (+ (multi (double a) (halve (- b 1))) a))))

(test* "ex 1.17" 2  (multi 1 2))
(test* "ex 1.18" 4  (multi 2 2))
(test* "ex 1.17" 18 (multi 2 9))
(test* "ex 1.17" 42 (multi 6 7))
(test* "ex 1.17" 49 (multi 7 7))

(test-end :exit-on-failure #t)
