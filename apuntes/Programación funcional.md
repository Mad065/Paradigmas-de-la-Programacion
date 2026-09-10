# Apuntes: Programación Funcional

El **Paradigma Funcional** es un estilo de programación declarativo que trata la computación como la evaluación de **funciones matemáticas** y evita el cambio de estado (mutabilidad) y los datos mutables.

---

## 1. Fundamentos Matemáticos

El paradigma funcional tiene sus raíces en las matemáticas puras. En su forma más básica, un programa se conceptualiza como:

> **Entradas $\Rightarrow$ Programa $\Rightarrow$ Salida**

### Conceptos Clave de las Funciones Matemáticas
* **Dominio:** Es el conjunto de todos los valores de entrada posibles (argumentos) que la función puede aceptar.
* **Contradominio (o Codominio):** Es el conjunto de todos los valores de salida posibles (resultados) que la función puede producir.
* **Composición de Funciones:** Es el proceso de combinar dos o más funciones para producir una nueva. El resultado de una función se convierte directamente en la entrada de la siguiente. Si tenemos $f(x)$ y $g(x)$, su composición es $f(g(x))$.

---

## 2. Características de la Programación Funcional

Para que un lenguaje o programa se considere genuinamente funcional, suele cumplir con los siguientes principios:

1. **Separación clara de Entradas y Salidas:** Todos los procedimientos son funciones puras. Distinguen claramente qué datos entran y qué resultados salen, sin afectar nada fuera de su ámbito (cero efectos secundarios).
2. **Inmutabilidad (No hay asignaciones):** En la Programación Funcional pura, no existen las variables tradicionales. Una vez que un nombre (o "variable") se enlaza a un valor, se comporta como una **constante**. No puedes reasignarle un valor nuevo.
3. **Recursividad (No hay bucles):** Al no haber variables mutables, estructuras de control iterativas como `for` o `while` no tienen sentido. En su lugar, los ciclos se reemplazan por **llamadas recursivas** (funciones que se llaman a sí mismas).
4. **Transparencia Referencial (Determinismo):** El valor de retorno de una función depende **exclusivamente** de los valores de sus entradas, y no del orden de evaluación, el estado global o la ruta de ejecución. Si envías los mismos argumentos, siempre obtendrás el mismo resultado.
5. **Funciones de Primera Clase (First-class citizens):** Las funciones son tratadas como cualquier otro tipo de dato (como un entero o un string). Esto significa que puedes:
   * Asignar una función a una variable.
   * **Aplicar una función a otra función** (pasarla como argumento).
   * Retornar una función como resultado de otra función (Funciones de Orden Superior).

---

## 3. El Cálculo Lambda ($\lambda$)

Es un sistema formal en la lógica matemática inventado por Alonzo Church en los años 30. Sirve como la **teoría general de funciones** y es el núcleo teórico de todos los lenguajes de programación funcional.

Se basa en dos operaciones principales:

* **Abstracción Lambda (Creación de funciones):** Es el proceso de definir una función anónima. Sirve para declarar qué variables son los parámetros.
  * *Ejemplo:* $\lambda x. M$ (donde $x$ es el parámetro y $M$ es el cuerpo de la función).
* **Aplicación Lambda (Uso de funciones):** Es el proceso de suministrarle un argumento a una función para que sea evaluada. (Una función es la entrada de otra función).
  * *Ejemplo:* $M \ N$ (Aplicar la función $M$ al argumento $N$).

---

## 4. Reducciones en Cálculo Lambda

Para "resolver" o evaluar expresiones en el cálculo lambda, utilizamos reglas de reducción. Las dos más importantes son:

### Conversión Alfa ($\alpha$-conversión)
Consiste en renombrar las variables vinculadas (los parámetros) para evitar conflictos de nombres o "colisiones". El significado de la función no cambia, solo la "etiqueta" de la variable que utiliza.

* **Ejemplo de identidad:** 
  $\lambda x. x$ es lógicamente equivalente a $\lambda y. y$.
* **Ejemplo para evitar colisión:** 
  Si tenemos la expresión $(\lambda x. (\lambda x. x)) \ z$, la variable $x$ de adentro se confunde con la de afuera. Aplicando una $\alpha$-conversión a la función interna, queda mucho más claro: 
  $\rightarrow (\lambda x. (\lambda y. y)) \ z$

### Reducción Beta ($\beta$-reducción)
Es el mecanismo de cálculo real. Consiste en aplicar la función, sustituyendo todas las apariciones del parámetro vinculado en el cuerpo de la función por el argumento proporcionado.

* **Ejemplo 1 (Sustitución simple con notación prefija):**
  $(\lambda x. * \ 2 \ x) \ 4$
  *Sustituimos la `x` por el `4`:*
  $\rightarrow (* \ 2 \ 4)$
  $\rightarrow 8$

* **Ejemplo 2 (Reducción por pasos con currificación):**
  $(\lambda x. \lambda y. + \ x \ y) \ 4 \ 3$
  *Paso 1: Aplicamos el primer argumento `4` a la variable más externa `x`:* 
  $\rightarrow (\lambda y. + \ 4 \ y) \ 3$
  *Paso 2: Aplicamos el segundo argumento `3` a la variable `y`:* 
  $\rightarrow + \ 4 \ 3$
  $\rightarrow 7$

---

## 5. Notaciones de Expresiones

Dependiendo del lenguaje, la forma de escribir los operadores y las funciones (sintaxis) puede variar. Aquí están las tres notaciones principales:

| Notación | Descripción | Ejemplo Matemático |
| :--- | :--- | :--- |
| **Infija (Infix)** | El operador va en medio de los operandos. Es la forma tradicional matemática. | `5 * 3` |
| **Prefija (Prefix)** | El operador va antes de los operandos. Muy usada en cálculo lambda y lenguajes como `Lisp`. | `* 5 3` |
| **Postfija (Postfix)** | El operador va después de los operandos. Conocida como "Notación Polaca Inversa". | `5 3 *` |

---

## 6. Sintaxis y Semántica en Lenguajes de Programación

Al estudiar lenguajes (ya sean funcionales o imperativos), siempre los analizamos bajo dos lentes:

* **Sintaxis:** Es la gramática y las reglas de escritura del lenguaje. Dicta **cómo** se deben escribir las instrucciones para que el compilador/intérprete no marque error (puntos y comas, paréntesis, palabras reservadas).
* **Semántica:** Es el **significado** de esas instrucciones. Qué es lo que realmente hace el programa cuando se ejecuta esa línea de código (el comportamiento lógico de la sintaxis).

> [!NOTE]
> En la programación funcional, la **semántica** está fuertemente ligada a la evaluación matemática de expresiones puras, a diferencia de la semántica de la programación imperativa, que se basa en cambiar el estado de la memoria paso a paso.
```eof