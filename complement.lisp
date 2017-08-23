


(defun invert-decimal (s)
  (map 'string
       (lambda (c)
         (code-char 
          (+ (char-code #\0)
             (- (char-code c))
             (char-code #\9))))
       s))


(defun display-complement (v)
  (cond ((zerop v) "0")
        ((> 0 v) (format nil "९~a" (invert-decimal (format nil "~a" (- (1+ v))))))
        (t (format nil "0~a" v))))

(defun parse-complement (s)
  (let ((st (string-trim '(#\Space #\NewLine #\Tab) s)))
    (if (equal #\९ (elt st 0))
        (1- (- (read-from-string (invert-decimal (substitute #\9 #\९ st)))))
        (read-from-string st))))


(defun fc (f &rest args)
  (display-complement
   (apply f (mapcar #'parse-complement args))))


(defun add-string (sa sb)
  
  
