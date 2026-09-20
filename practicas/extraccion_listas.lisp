;;;; Practica 3: Extracción de Elementos con CAR y CDR
;;;; Paradigmas de la Programación - ESCOM
;;;; Autor: Mad0

;;; Definición de las listas usando setq
;;; Cada variable almacena una de las listas de la imagen
(setq lista1 '(agua papel dinero tierra))
(setq lista2 '((agua papel) dinero tierra))
(setq lista3 '((agua papel) (dinero tierra)))
(setq lista4 '(agua (papel dinero) tierra))
(setq lista5 '((agua papel) ((dinero) tierra)))

;; Ejemplos de uso (Pruebas)
(format t "--- Extracción de Elementos en Lisp ---~%")

;; Pruebas de extracción para Lista 1
(format t "~%--- Lista 1: ~a ---~%" lista1)
(format t "Extracción de Agua: ~a~%" (car lista1))
(format t "Extracción de Papel: ~a~%" (car (cdr lista1)))
(format t "Extracción de Tierra: ~a~%" (car (cdr (cdr (cdr lista1)))))

;; Pruebas de extracción para Lista 2
(format t "~%--- Lista 2: ~a ---~%" lista2)
(format t "Extracción de Agua: ~a~%" (car (car lista2)))
(format t "Extracción de Papel: ~a~%" (car (cdr (car lista2))))
(format t "Extracción de Tierra: ~a~%" (car (cdr (cdr lista2))))

;; Pruebas de extracción para Lista 3
(format t "~%--- Lista 3: ~a ---~%" lista3)
(format t "Extracción de Agua: ~a~%" (car (car lista3)))
(format t "Extracción de Papel: ~a~%" (car (cdr (car lista3))))
(format t "Extracción de Tierra: ~a~%" (car (cdr (car (cdr lista3)))))

;; Pruebas de extracción para Lista 4
(format t "~%--- Lista 4: ~a ---~%" lista4)
(format t "Extracción de Agua: ~a~%" (car lista4))
(format t "Extracción de Papel: ~a~%" (car (car (cdr lista4))))
(format t "Extracción de Tierra: ~a~%" (car (cdr (cdr lista4))))

;; Pruebas de extracción para Lista 5
(format t "~%--- Lista 5: ~a ---~%" lista5)
(format t "Extracción de Agua: ~a~%" (car (car lista5)))
(format t "Extracción de Papel: ~a~%" (car (cdr (car lista5))))
(format t "Extracción de Tierra: ~a~%" (car (cdr (car (cdr lista5)))))