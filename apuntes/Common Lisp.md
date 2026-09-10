# Apuntes: Common Lisp

**LISP** (LISt Processing) es uno de los lenguajes de programación de alto nivel más antiguos que aún se utilizan. Fue pionero en muchas ideas de las ciencias de la computación y sentó las bases para el paradigma funcional. **Common Lisp** (CL) es su especificación estandarizada multiparadigma más importante.

---

## 1. Introducción a Lisp y Common Lisp

**LISP** fue creado en 1958 por John McCarthy. Introdujo conceptos revolucionarios para la época como la estructura de datos de árbol, el recolector de basura, el tipado dinámico, y el concepto de que "el código es datos y los datos son código" (Homoiconicidad).

**Common Lisp** (CL) es una especificación estandarizada (ANSI) del lenguaje Lisp desarrollada en los años 80 y 90 para unificar las múltiples variantes de Lisp que existían en ese entonces. Es un lenguaje multiparadigma: soporta programación funcional, imperativa y orientada a objetos (a través de CLOS - Common Lisp Object System).

---

## 2. Sintaxis y Léxico: S-Expressions

La característica visual más notoria de Lisp son los paréntesis. El código se escribe mediante **S-expressions** (Expresiones Simbólicas).
Una expresión simbólica puede ser:

* **Un Átomo**: Un número, un símbolo, una cadena, etc. (Ej. `42`, `hola`, `"texto"`).
* **Una Lista**: Una secuencia de átomos u otras listas, encerrada entre paréntesis. (Ej. `(1 2 3)`, `(+ 2 3)`).

> [!NOTE]
> **Regla de Oro en Lisp:** El primer elemento de una lista se evalúa como una función, macro o forma especial, y el resto de los elementos se evalúan como los argumentos que se le pasan.
> Ejemplo: `(+ 3 4)` llama a la función de suma `+` con los argumentos `3` y `4`.

---

## 3. Tipos de Datos Básicos

* **Números**: Enteros (`42`), Flotantes (`3.14`), Racionales (`2/3`), Complejos (`#C(2 3)`).
* **Símbolos**: Variables o nombres (Ej. `foo`, `bar`). Son case-insensitive por defecto.
* **Strings**: Cadenas de texto encerradas en comillas dobles (`"Hola Mundo"`).
* **Booleanos**: `t` para Verdadero (True) y `nil` para Falso (False). Nota: `nil` también representa la lista vacía `()`.
* **Listas**: Colecciones de datos `(1 2 3 "hola")`.

---

## 4. Operaciones Matemáticas y Lógicas

Lisp utiliza **notación prefija** (la función va antes de los argumentos).

```lisp
(+ 10 5)        ; Devuelve 15
(- 10 5)        ; Devuelve 5
(* 10 5)        ; Devuelve 50
(/ 10 5)        ; Devuelve 2
(+ 1 2 3 4 5)   ; Devuelve 15 (pueden tomar múltiples argumentos)
```

**Operadores Lógicos y Comparación:**
```lisp
(= 5 5)         ; t
(< 3 5)         ; t
(> 3 5)         ; nil
(and t nil)     ; nil
(or t nil)      ; t
(not t)         ; nil
```

---

## 5. Variables y Ámbito (Scope)

En Common Lisp existen variables globales y variables locales.

### Variables Globales (Variables Dinámicas)
Se definen convencionalmente con asteriscos alrededor del nombre (*earmuffs*) para distinguirlas.
```lisp
(defparameter *mi-variable* 100) ; Se puede redefinir y sobreescribir su valor original
(defvar *mi-constante* 50)       ; Solo se inicializa si no existe. No se sobreescribe al recargar.
```

### Variables Locales (Lexical Scope)
Se utiliza la forma especial `let` para crear variables temporales dentro de un bloque.
```lisp
(let ((x 10)
      (y 20))
  (+ x y)) ; Devuelve 30. x e y no existen fuera de este bloque.
```

---

## 6. Definición de Funciones (`defun`)

La macro `defun` se utiliza para definir nuevas funciones con nombre.
Sintaxis: `(defun nombre-funcion (parametros) cuerpo-de-la-funcion)`

```lisp
(defun saludar (nombre)
  (format t "¡Hola, ~a!~%" nombre)) ; ~a es para imprimir la variable, ~% es un salto de línea

(saludar "Mundo") ; Imprime "¡Hola, Mundo!"
```

En Lisp, el valor de la última expresión evaluada en el cuerpo de la función es lo que la función retorna (no se usa `return` explícito normalmente).

```lisp
(defun cuadrado (x)
  (* x x)) ; Retorna x al cuadrado
```

---

## 7. Condicionales

Common Lisp ofrece varias estructuras para control de flujo:

* **IF**: El condicional más básico. `(if condicion rama-verdadera rama-falsa)`
```lisp
(if (> 5 3)
    "Es mayor"
    "Es menor") ; Devuelve "Es mayor"
```

* **WHEN y UNLESS**: Se usan cuando solo importa la rama verdadera (`when`) o la rama falsa (`unless`). Permiten ejecutar múltiples expresiones.
```lisp
(when (> 5 3)
  (print "Es mayor")
  (print "Haciendo otra cosa"))
```

* **COND**: Excelente para múltiples condiciones (como un switch o if-elseif-else encadenado).
```lisp
(defun clasificar-numero (n)
  (cond ((< n 0) "Negativo")
        ((= n 0) "Cero")
        ((> n 0) "Positivo")))
```

---

## 8. Listas: El corazón de Lisp

Las listas están compuestas por celdas "Cons". Hay dos funciones fundamentales para manejar listas:
* `car`: Retorna el primer elemento de la lista (cabeza).
* `cdr`: Retorna el resto de la lista (cola).
* `cons`: Agrega un elemento al inicio de una lista.

```lisp
(car '(1 2 3))       ; Devuelve 1
(cdr '(1 2 3))       ; Devuelve (2 3)
(cons 1 '(2 3))      ; Devuelve (1 2 3)
```

> [!NOTE]
> Usamos un apóstrofe `'` antes de una lista (como en `'(1 2 3)`) para indicarle a Lisp que **no** evalúe esa lista como si fuera una llamada a función. Es una abreviatura de `(quote (1 2 3))`.

---

## 9. Iteración (Bucles)

Aunque la programación funcional prefiere la recursión, Common Lisp es pragmático e incluye potentes macros de bucle:

* **DOTIMES**: Ejecuta un bloque un número específico de veces.
```lisp
(dotimes (i 5)
  (print i)) ; Imprime del 0 al 4
```

* **DOLIST**: Itera sobre los elementos de una lista.
```lisp
(dolist (elemento '(a b c d))
  (print elemento))
```

* **LOOP**: La macro iterativa más versátil y compleja de Common Lisp.
```lisp
(loop for i from 1 to 5
      do (print i))
```

---

## 10. Recursión

Un ejemplo clásico del paradigma funcional: el cálculo del factorial.
```lisp
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
```
