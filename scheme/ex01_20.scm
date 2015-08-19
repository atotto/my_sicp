(use gauche.test)
(add-load-path "." :relative)
(test-start "ch1")

;;EXERCISE 1.20
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(test* "ex 1.20" 2 (gcd 206 40))

;; applicative-order evaluation (適用順序評価)
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 (remainder 6 4))
;(gcd 4 2)
;(gcd 2 (remainder 4 2))
;(gcd 2 0)
;(2)
; 4 times

;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder 40 (remainder 206 40))))
;(gcd (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder 40 (remainder 206 40))) (remainder (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder 40 (remainder 206 40))) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; 


(test-end :exit-on-failure #t)
