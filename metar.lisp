;;;; metar.lisp

(in-package #:metar)

;;; "metar" goes here. Hacks and glory await!

;; https://avwx.rest/documentation

(defun metar (icao)
  (json:decode-json-from-string
   (babel:octets-to-string
    (first
     (multiple-value-list
      (drakma:http-request
       (concatenate 'string
		    "https://avwx.rest/api/metar/"
		    icao
		    "?options=info,translate,summary,speech")
       :method :get
       :accept "application/json"))))))

(defun taf (icao)
  (json:decode-json-from-string
   (babel:octets-to-string
    (first
     (multiple-value-list
      (drakma:http-request
       (concatenate 'string
		    "https://avwx.rest/api/taf/"
		    icao
		    "?options=info,translate,summary")
       :method :get
       :accept "application/json"))))))
