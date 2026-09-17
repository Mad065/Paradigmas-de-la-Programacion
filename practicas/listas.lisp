;;;; Practica 2: Listas en Lisp y Búsqueda de Datos
;;;; Paradigmas de la Programación - ESCOM
;;;; Autor: José Antonio Martínez Castañón

;;; Definición de los datos de las 4 personas
;;; Formato de la lista: (Nombre Calle-número Teléfono)
(defvar *directorio*
  '((Ana "Reforma 222" 5512345678)
    (Luis "Insurgentes Sur 105" 5598765432)
    (Sofia "Av. Universidad 3000" 5544332211)
    (Carlos "Eje Central 45" 5599887766)))

;;; Solución 1: Usando la estructura cond
(defun obtener-dato-cond (numero-persona tipo-dato)
  "Obtiene un dato específico de una persona evaluando condiciones con cond."
  (let ((persona (nth (- numero-persona 1) *directorio*)))
    (cond 
      ((eq tipo-dato 'nombre)    (car persona))
      ((eq tipo-dato 'direccion) (cadr persona))
      ((eq tipo-dato 'telefono)  (caddr persona))
      (t "Dato no válido"))))

;;; Solución 2: Usando la estructura case (Solución óptima para este caso)
(defun obtener-dato-case (numero-persona tipo-dato)
  "Obtiene un dato específico de una persona utilizando ramificación con case."
  (let ((persona (nth (- numero-persona 1) *directorio*)))
    (case tipo-dato
      (nombre    (car persona))
      (direccion (cadr persona))
      (telefono  (caddr persona))
      (otherwise "Dato no válido"))))

;;; Solución 3: Usando if anidados (Alternativa básica)
(defun obtener-dato-if (numero-persona tipo-dato)
  "Obtiene un dato específico de una persona utilizando if anidados."
  (let ((persona (nth (- numero-persona 1) *directorio*)))
    (if (eq tipo-dato 'nombre)
        (car persona)
        (if (eq tipo-dato 'direccion)
            (cadr persona)
            (if (eq tipo-dato 'telefono)
                (caddr persona)
                "Dato no válido")))))


;; Ejemplos de uso (Pruebas)
(format t "--- Practica 2: Búsqueda en Listas de Lisp ---~%")

;; Pruebas con la Solución 1 (cond)
(format t "~%>> Probando función con COND:~%")
(let ((num 1) (dato 'nombre))
  (format t "El ~a de la persona ~a es: ~a~%" dato num (obtener-dato-cond num dato)))

(let ((num 3) (dato 'direccion))
  (format t "La ~a de la persona ~a es: ~a~%" dato num (obtener-dato-cond num dato)))

;; Pruebas con la Solución 2 (case)
(format t "~%>> Probando función con CASE:~%")
(let ((num 2) (dato 'telefono))
  (format t "El ~a de la persona ~a es: ~a~%" dato num (obtener-dato-case num dato)))

(let ((num 4) (dato 'nombre))
  (format t "El ~a de la persona ~a es: ~a~%" dato num (obtener-dato-case num dato)))

;; Pruebas con la Solución 3 (if anidados)
(format t "~%>> Probando función con IF anidados:~%")
(let ((num 1) (dato 'telefono))
  (format t "El ~a de la persona ~a es: ~a~%" dato num (obtener-dato-if num dato)))

(let ((num 2) (dato 'edad)) ; Prueba de error intencional
  (format t "El dato ~a de la persona ~a arroja: ~a~%" dato num (obtener-dato-if num dato)))