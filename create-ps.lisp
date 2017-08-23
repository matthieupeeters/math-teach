


(defun start (d)
  (format d "~&%!PS~&0.05 setlinewidth~&")
  (format d "~&/c {~&200 mul 300 add exch~&200 mul 300 add exch~&}~&def~&~%"))


(defun end (d)
  (format d "~&showpage~%~%"))

(defun axes (d)
  (format d "~&-1 0 c moveto 1 0 c lineto 0 -1 c moveto 0 1 c lineto~&stroke~&")) 

                                        ; (defun drawline (x0

(defun drawfun (d f)
  (format d "~&~a ~a c moveto" -1.0 (funcall f -1.0))
  (do ((x -1.0 (+ x 0.001)))
      ((> x 1.0))
    (let ((y (funcall f x)))
      (format d "~&~a ~a c lineto~&" x y)))
  (format d "~&stroke~&"))


(defun build (d)
  (start d)
  (axes d)
  (format d "~&0 0 1 setrgbcolor~&")
  (drawfun d (lambda (x) (realpart (sqrt x))))
  (format d "~&1 0 0 setrgbcolor~&")
  (drawfun d (lambda (x) (imagpart (sqrt x))))
  (end d))



(let ((d (open "~/tmp/ps.ps" :direction :output :if-exists :supersede)))
  (build d)
  (close d))



