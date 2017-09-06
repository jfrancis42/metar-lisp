;;;; metar.asd

(asdf:defsystem #:metar
  :description "A Common Lisp client for pulling METAR data from the AVWX REST API."
  :author "Jeff Francis <jeff@gritch.org>"
  :license "MIT, see file LICENSE"
  :depends-on (#:cl-json
               #:drakma
               #:babel)
  :serial t
  :components ((:file "package")
               (:file "metar")))

