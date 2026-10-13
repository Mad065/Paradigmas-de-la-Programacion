;;;; Practica 4: Manipulación Recursiva de Listas
;;;; Paradigmas de la Programación - ESCOM
;;;; Autor: José Antonio Martínez Castañón

;;; Función a) Sustituir
;;; Toma como parámetros la lista y dos elementos, reemplaza
;;; todas las apariciones del primero por el segundo.
(defun sustituir (viejo nuevo l)
  "Reemplaza todas las apariciones del elemento 'viejo' por 'nuevo' en la lista 'l'."
  (cond ((null l) nil)
        ((eq (car l) viejo)
         (cons nuevo (sustituir viejo nuevo (cdr l))))
        (t
         (cons (car l) (sustituir viejo nuevo (cdr l))))))

;;; Función b) Duplicar
;;; Duplica los elementos de una lista.
(defun duplica (l)
  "Duplica cada elemento de la lista 'l' de forma recursiva."
  (cond ((null l) nil)
        (t (cons (car l)
                 (cons (car l)
                       (duplica (cdr l)))))))


;; Ejemplos de uso (Pruebas)
(format t "--- Manipulación Recursiva de Listas en Lisp ---~%")

;; Prueba 1: Lista '(X 1 X 2 X 3)
(let ((l1 '(X 1 X 2 X 3)))
  (format t "Prueba 1 - Lista original: ~a~%" l1)
  (format t "  (SUSTITUIR X Y L) -> ~a~%" (sustituir 'X 'Y l1))
  (format t "  (DUPLICA L)       -> ~a~%~%" (duplica l1)))

;; Prueba 2: Lista '(R S T U)
(let ((l2 '(R S T U)))
  (format t "Prueba 2 - Lista original: ~a~%" l2)
  (format t "  (SUSTITUIR X Z L) -> ~a~%" (sustituir 'X 'Z l2))
  (format t "  (DUPLICA L)       -> ~a~%~%" (duplica l2)))

;; Prueba 3: Lista '(A B C D A B)
(let ((l3 '(A B C D A B)))
  (format t "Prueba 3 - Lista original: ~a~%" l3)
  (format t "  (SUSTITUIR A B L) -> ~a~%" (sustituir 'A 'B l3))
  (format t "  (DUPLICA L)       -> ~a~%~%" (duplica l3)))