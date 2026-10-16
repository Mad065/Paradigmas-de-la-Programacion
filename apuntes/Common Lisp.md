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

### Comentarios
En Common Lisp los comentarios inician con punto y coma (`;`). Por convención estilística se utilizan según su nivel:
* `;;;;` (Cuatro): Encabezado general del archivo o programa.
* `;;;` (Tres):Descripción de una sección o bloque de funciones.
* `;;` (Dos): Comentario dentro de una función o previo a un bloque de código alineado.
* `;` (Uno): Comentario corto al final de una misma línea de código.

---

## 3. Tipos de Datos Básicos

* **Números**: Enteros (`42`), Flotantes (`3.14`), Racionales (`2/3`), Complejos (`#C(2 3)`).
* **Símbolos**: Identificadores o nombres (Ej. `foo`, `'nombre`, `'agua`). Son *case-insensitive* por defecto. Cuando se anteceden con `'`, se evalúan como el símbolo literal en sí mismo y no como el valor de una variable.
* **Strings**: Cadenas de texto encerradas en comillas dobles (`"Hola Mundo"`).
* **Booleanos**: `t` para Verdadero (True) y `nil` para Falso (False). Nota: `nil` también representa la lista vacía `()`.
* **Listas**: Colecciones de datos que pueden contener átomos u otras listas anidadas `(1 2 3 "hola")`.

---

## 4. Operaciones Matemáticas, Lógicas y de Comparación

Lisp utiliza **notación prefija** (el operador o función va antes de los argumentos).

```lisp
(+ 10 5)        ; Devuelve 15
(- 10 5)        ; Devuelve 5
(* 10 5)        ; Devuelve 50
(/ 10.0 5.0)    ; Devuelve 2.0 (división flotante; (/ 9 5) devuelve el racional 9/5)
(+ 1 2 3 4 5)   ; Devuelve 15 (pueden tomar múltiples argumentos)
```

**Operadores Numéricos y Lógicos:**
```lisp
(= 5 5)         ; t (comparación exclusivamente numérica)
(< 3 5)         ; t
(> 3 5)         ; nil
(and t nil)     ; nil
(or t nil)      ; t
(not t)         ; nil
```

**Comparación de Símbolos y Objetos (`eq`, `eql`, `equal`):**
* `eq`: Verifica si dos elementos son exactamente el mismo objeto en memoria. Es el estándar para comparar **símbolos** (Ej. `(eq tipo-dato 'nombre)`).
* `eql`: Como `eq`, pero también compara de forma segura números del mismo tipo y caracteres.
* `equal`: Compara si dos estructuras (como listas o cadenas de texto/strings) tienen el mismo contenido estructural.

```lisp
(eq 'nombre 'nombre)       ; t
(eq 'nombre 'direccion)    ; nil
(equal "Hola" "Hola")      ; t
```

---

## 5. Variables y Ámbito (Scope)

En Common Lisp existen variables globales, asignación de variables y variables locales.

### Variables Globales (Variables Dinámicas)
Se definen convencionalmente con asteriscos alrededor del nombre (*earmuffs*) para distinguirlas.
```lisp
(defparameter *mi-variable* 100) ; Se puede redefinir y sobreescribir su valor original
(defvar *mi-constante* 50)       ; Solo se inicializa si no existe. No se sobreescribe al recargar.
```

### Asignación con `setq` y `setf`
`setq` asigna un valor a una variable (símbolo). En scripts sencillos suele usarse para definir o modificar variables de trabajo:
```lisp
(setq lista1 '(agua papel dinero tierra))
```
> [!TIP]
> `setf` es la macro de asignación generalizada en Common Lisp (puede modificar tanto variables como posiciones específicas dentro de una lista o arreglo), mientras que `setq` funciona únicamente sobre símbolos de variables.

### Variables Locales (Lexical Scope)
Se utiliza la forma especial `let` para crear variables temporales dentro de un bloque.
```lisp
(let ((x 10)
      (y 20))
  (+ x y)) ; Devuelve 30. x e y no existen fuera de este bloque.
```

---

## 6. Definición de Funciones (`defun`) e Impresión (`format`)

La macro `defun` se utiliza para definir nuevas funciones con nombre. Opcionalmente se puede colocar una cadena de documentación (*docstring*) justo después de los parámetros.

Sintaxis:
```lisp
(defun nombre-funcion (parametros)
  "Cadena opcional de documentación (docstring) que describe qué hace la función."
  cuerpo-de-la-funcion)
```

En Lisp, el valor de la última expresión evaluada en el cuerpo de la función es lo que la función retorna automáticamente:

```lisp
(defun celsius-a-fahrenheit (celsius)
  "Convierte grados Celsius a Fahrenheit."
  (+ (* celsius (/ 9.0 5.0)) 32.0))
```

### Salida Formateada con `format`
La función `format` es equivalente al `printf` de C:
* `(format t "texto..." arg1 arg2)`
* El primer argumento `t` indica que se imprima en la salida estándar (consola). Si se pasa `nil`, retorna el texto como un string en lugar de imprimirlo.
* `~a`: Inserta el valor de un argumento en formato legible para humanos (*aesthetic*).
* `~%`: Inserta un salto de línea (equivalente a `\n`).

```lisp
(let ((temp-c 0.0))
  (format t "~a C equivalen a ~a F~%" temp-c (celsius-a-fahrenheit temp-c)))
; Imprime: 0.0 C equivalen a 32.0 F
```

---

## 7. Condicionales

Common Lisp ofrece varias estructuras para control de flujo:

* **`if`**: El condicional más básico. `(if condicion rama-verdadera rama-falsa)`. Pueden anidarse varios `if` para evaluar múltiples casos.
```lisp
(if (> 5 3)
    "Es mayor"
    "Es menor") ; Devuelve "Es mayor"
```

* **`when` y `unless`**: Se usan cuando solo importa la rama verdadera (`when`) o la rama falsa (`unless`). Permiten ejecutar múltiples expresiones sin necesidad de agruparlas.
```lisp
(when (> 5 3)
  (print "Es mayor")
  (print "Haciendo otra cosa"))
```

* **`cond`**: Excelente para evaluar múltiples condiciones en orden (como un `if / else if / else`). Se usa `t` en la última cláusula como caso por defecto (*else*):
```lisp
(cond 
  ((eq tipo-dato 'nombre)    (car persona))
  ((eq tipo-dato 'direccion) (cadr persona))
  ((eq tipo-dato 'telefono)  (caddr persona))
  (t "Dato no válido")) ; Se ejecuta si ninguna condición anterior fue verdadera
```

* **`case`**: Estructura de selección múltiple que compara un valor clave contra constantes (similar a `switch-case` en C/Java, sin necesidad de `break`). Usa `otherwise` (o `t`) para el caso por defecto:
```lisp
(case tipo-dato
  (nombre    (car persona))
  (direccion (cadr persona))
  (telefono  (caddr persona))
  (otherwise "Dato no válido"))
```

---

## 8. Listas: El corazón de Lisp

Las listas están compuestas por celdas **"Cons"**. Las funciones fundamentales para construir y extraer datos de listas son:
* `car`: Retorna el **primer elemento** de la lista (cabeza).
* `cdr`: Retorna el **resto de la lista** sin el primer elemento (cola).
* `cons`: Agrega un elemento al inicio de una lista.

```lisp
(car '(1 2 3))       ; Devuelve 1
(cdr '(1 2 3))       ; Devuelve (2 3)
(cons 1 '(2 3))      ; Devuelve (1 2 3)
```

> [!NOTE]
> Usamos un apóstrofe `'` antes de una lista (como en `'(1 2 3)`) para indicarle a Lisp que **no** evalúe esa lista como si fuera una llamada a función. Es una abreviatura de `(quote (1 2 3))`.

### Extracción en Listas Anidadas y Abreviaturas (`cadr`, `caddr`, `nth`)

Cuando se trabaja con listas dentro de listas, se pueden combinar llamadas a `car` y `cdr` de adentro hacia afuera:

```lisp
(setq lista2 '((agua papel) dinero tierra))

(car lista2)               ; Devuelve la sublista: (AGUA PAPEL)
(car (car lista2))         ; Devuelve: AGUA
(car (cdr (car lista2)))   ; Devuelve: PAPEL
(car (cdr (cdr lista2)))   ; Devuelve: TIERRA
```

**Funciones abreviadas (`c...r`):**
Common Lisp permite abreviar hasta 4 niveles de combinaciones de `car` (`a`) y `cdr` (`d`), leyéndose de derecha a izquierda:
* `(cadr x)` equivale a `(car (cdr x))` $\rightarrow$ **2.º elemento** de la lista.
* `(caddr x)` equivale a `(car (cdr (cdr x)))` $\rightarrow$ **3.er elemento** de la lista.
* `(cadddr x)` equivale a `(car (cdr (cdr (cdr x))))` $\rightarrow$ **4.º elemento** de la lista.
* `(caar x)` equivale a `(car (car x))` $\rightarrow$ **1.er elemento de la primera sublista**.

**Acceso por índice con `nth`:**
* `(nth n lista)`: Devuelve el elemento en la posición `n` de la lista (**indexado desde 0**).
```lisp
(defvar *directorio*
  '((Ana "Reforma 222" 5512345678)
    (Luis "Insurgentes Sur 105" 5598765432)))

(nth 0 *directorio*) ; Devuelve (ANA "Reforma 222" 5512345678)
(nth 1 *directorio*) ; Devuelve (LUIS "Insurgentes Sur 105" 5598765432)
```

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

---

## 11. Documentación y Referencias Recomendadas

* **[Common Lisp Language Reference (Community Docs)](https://lisp-docs.github.io/cl-language-reference/)**: Referencia moderna, limpia y con buscador integrado de toda la especificación del lenguaje Common Lisp.
* **[Common Lisp HyperSpec (CLHS)](https://www.lispworks.com/documentation/HyperSpec/Front/index.htm)**: La documentación oficial estándar ANSI de Common Lisp más completa y detallada (el estándar de facto para consultar cada función, macro y forma especial).
* **[The Common Lisp Cookbook](https://lispcookbook.github.io/cl-cookbook/)**: Excelente guía práctica comunitaria con ejemplos claros y recetas de código para resolver problemas comunes paso a paso.
* **[Practical Common Lisp (Peter Seibel)](https://gigamonkeys.com/book/)**: Libro completo y gratuito en línea, considerado la mejor introducción práctica al lenguaje.
* **[Common Lisp Quick Reference](https://clqr.boundp.org/)**: Hoja de referencia rápida (*cheatsheet*) organizada por categorías.
