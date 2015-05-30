(define-module testutil
  (use gauche.test)
  (export expect-delta))

(select-module testutil)

;; module body

(define (relative-error x y)
  (/ (abs (- x y)) (max (abs x) (abs y))))

(define (expect-delta . opt)
  (let ((tolerance (get-optional opt 1e-10)))
    (lambda (x y) (<= (relative-error x y) tolerance))))

(provide "testutil")
