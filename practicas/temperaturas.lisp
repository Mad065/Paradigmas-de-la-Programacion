;;;; Practica 1: Conversión de Temperaturas
;;;; Paradigmas de la Programación - ESCOM
;;;; Autor: José Antonio Martínez Castañón

;;; Función para convertir de Celsius a Fahrenheit
;;; Fórmula: (C * 9/5) + 32
(defun celsius-a-fahrenheit (celsius)
  "Convierte grados Celsius a Fahrenheit."
  (+ (* celsius (/ 9.0 5.0)) 32.0))

;;; Función para convertir de Fahrenheit a Celsius
;;; Fórmula: (F - 32) * 5/9
(defun fahrenheit-a-celsius (fahrenheit)
  "Convierte grados Fahrenheit a Celsius."
  (* (- fahrenheit 32.0) (/ 5.0 9.0)))


;; Ejemplos de uso (Pruebas)
(format t "--- Conversión de Temperaturas en Lisp ---~%")

;; Prueba de Celsius a Fahrenheit
(let ((temp-c 0.0))
  (format t "~a C equivalen a ~a F~%" temp-c (celsius-a-fahrenheit temp-c)))

(let ((temp-c 100.0))
  (format t "~a C equivalen a ~a F~%" temp-c (celsius-a-fahrenheit temp-c)))

;; Prueba de Fahrenheit a Celsius
(let ((temp-f 32.0))
  (format t "~a F equivalen a ~a C~%" temp-f (fahrenheit-a-celsius temp-f)))

(let ((temp-f 212.0))
  (format t "~a F equivalen a ~a C~%" temp-f (fahrenheit-a-celsius temp-f)))

