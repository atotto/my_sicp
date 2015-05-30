#!/usr/bin/env gosh

(use gauche.interactive)
(use file.util)
(add-load-path "." :relative)

(define (main args)
  (let ((dir (sys-dirname (car args))))
    (for-each (lambda (test-script)
                (let ((path (string-join (list test-script) "/")))
                  (display "=== ")
                  (display path)
                  (display "\n")
                     (load path)))
              (directory-list dir
                              :filter (lambda (x)
                                        (rxmatch #/^ex.+\.scm$/ x)))))
  0)


