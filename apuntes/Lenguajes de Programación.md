# Apuntes: Lenguajes de Programación

Un **lenguaje de programación** es un sistema estructurado de comunicación que permite darle instrucciones a una computadora. Existen diferentes formas de clasificar estos lenguajes según sus características, uso y evolución.

---

## 1. Clasificación por Nivel de Abstracción

Se refiere a qué tan cercano está el lenguaje al idioma de la máquina (ceros y unos) o al lenguaje humano:

* **Alto Nivel:** Diseñados para que las personas puedan leerlos y escribirlos con facilidad utilizando palabras en inglés y estructuras lógicas intuitivas. Son independientes del hardware, por lo que el mismo código puede funcionar en distintos equipos.
* **Nivel Medio:** *(Mencionado en algunas clasificaciones)* Suelen ser lenguajes que tienen características de alto nivel pero permiten un manejo de memoria y recursos cercano al bajo nivel (ej. `C` o `C++`).
* **Bajo Nivel:** Están muy cerca del hardware. Permiten un control directo sobre los componentes físicos y la memoria, pero son más difíciles de leer y aprender para el ser humano. El nivel más básico utiliza el código binario.

---

## 2. Clasificación por Forma de Ejecución

Dependiendo de cómo la computadora traduce y ejecuta el código escrito por el programador:

* **Compilados:** Traducen todo el código fuente a lenguaje máquina nativo antes de ejecutarlo. Esto genera un archivo ejecutable previo que el procesador lee directamente.
  * **Ejemplos:** `C`, `C++`, `Go`, `Swift`, `Pascal`, `Fortran`, `Ada`.
* **Interpretados:** Un programa llamado "intérprete" lee y ejecuta el código línea por línea en tiempo de ejecución, sin crear un archivo ejecutable previo.
  * **Ejemplos:** `Python`, `JavaScript`, `PHP`, `Ruby`, `Perl`.

> [!NOTE]
> Algunos lenguajes como **Java** o **C#** utilizan un modelo híbrido, donde primero se compilan a un código intermedio (bytecode) y luego son interpretados o compilados en tiempo de ejecución (JIT) por una máquina virtual.

---

## 3. Clasificación por Propósito

Según el área de aplicación para la que fueron diseñados:

* **General:** Sirven para una gran variedad de aplicaciones (desarrollo web, inteligencia artificial, sistemas operativos, etc.). No se limitan a un solo dominio.
  * **Ejemplos:** `Python`, `Java`, `C`, `C++`, `JavaScript`.
* **Específico (DSL):** Se enfocan en una tarea o dominio muy delimitado y no buscan ser universales.
  * **Ejemplos:** `SQL` (bases de datos), `HTML` (estructuración web), `R` (estadística).

---

## 4. Clasificación por Generación

Refleja la evolución histórica y tecnológica de los lenguajes:

1. **1GL (Primera Generación) — Lenguaje Máquina:** Código binario formado por ceros y unos que la CPU ejecuta de forma directa. Depende totalmente del hardware de la computadora.
2. **2GL (Segunda Generación) — Lenguaje Ensamblador:** Utiliza abreviaturas y códigos mnemotécnicos para las instrucciones de máquina. Requiere un programa ensamblador para traducirlo a código binario.
3. **3GL (Tercera Generación) — Lenguajes de Alto Nivel:** Lenguajes procedimentales e imperativos basados en palabras en inglés y estructuras lógicas claras.
4. **4GL (Cuarta Generación) — Orientados a Gestión:** Especializados en aplicaciones de gestión, manejo de bases de datos, administración de empresas, inventarios y finanzas (evitando programar desde cero el movimiento de archivos).
5. **5GL (Quinta Generación) — Orientados a IA:** Orientados a Inteligencia Artificial y Procesamiento de Lenguaje Natural. No siguen una receta de pasos fijos; se diseñaron para que la computadora simule el pensamiento humano, reconozca patrones o entienda el idioma hablado.

---

## 5. Paradigmas de Programación

Un **paradigma** es el "estilo" o la forma en la que se estructura y piensa el código para resolver un problema. Se dividen en dos grandes ramas principales, de las cuales se derivan otros paradigmas más específicos:

| Característica | Paradigma Imperativo | Paradigma Declarativo |
| :--- | :--- | :--- |
| **Enfoque** | Explica **¿Cómo?** paso a paso. | Describe **¿Qué?** se quiere lograr. |
| **Definición** | Se definen los pasos y en qué secuencia debe ejecutarlos el programa. | Se describe el resultado que se debe solucionar, no los pasos individuales. |
| **Herramientas** | Usa bucles, condicionales y modifica variables constantemente. | Usa funciones, expresiones y lógica. Evita cambiar datos asignados. |
| **Ejemplo análogo** | Una receta de cocina detallada (paso 1, paso 2...). | El menú de un restaurante (pides el plato, no cómo cocinarlo). |
| **Sub-paradigmas (Tipos)** | 1. **Procedimental (o estructurada):** Agrupa el código en funciones/rutinas paso a paso.<br>2. **Orientado a Objetos (POO):** Organiza el código en "objetos" que contienen datos y métodos. | 1. **Funcional:** Se basa en funciones matemáticas puras (sin alterar datos).<br>2. **Lógica:** Basado en reglas y hechos lógicos (IA).<br>3. **De Consulta:** Para pedir datos a una base de datos. |
| **Ejemplos de Lenguajes** | `C`, `C++`, `Java`, `Pascal`, `Fortran`, `Algol` *(la mayoría de los lenguajes tradicionales)* | `Haskell`, `Lisp` *(Funcional)*, `Prolog` *(Lógico)*, `SQL` *(De consulta / lógico)* |

---

## 6. Concepto Clave: ¿Qué es una variable?

Es un contenedor para guardar datos en la memoria de una computadora mientras se ejecuta un programa.

> 💡 **Analogía:** Imagina una caja con una etiqueta; puedes meter un valor dentro, usar el nombre de la etiqueta para recordar qué hay dentro, y cambiar el valor cuando quieras.

### La variable según el paradigma:
* **En el paradigma Imperativo:** El valor de la variable cambia o se reasigna constantemente a lo largo del programa (estado mutable).
* **En el paradigma Declarativo:** Una variable funciona más como una constante matemática: una vez que se le asigna un valor, este no cambia (estado inmutable).

---

## 7. Lista de Lenguajes de Programación Mencionados

Una recopilación de los lenguajes históricos y modernos mencionados en los textos:

* **Lenguajes Modernos y Populares:** `C`, `C++`, `C#`, `Java`, `JavaScript`, `Python`, `Ruby`, `Perl`, `PHP`, `Swift`, `Kotlin`, `Go`, `Dart`, `R`, `F#`.
* **Propósito Específico y Bajo Nivel:** `SQL` *(Bases de datos)*, `Ensamblador` *(Bajo nivel)*.
* **Históricos y Académicos:** `Pascal`, `Fortran`, `Cobol`, `Basic`, `Matlab`, `Algol`, `B`, `PL/I`, `Ada`, `Lisp`, `Miranda`, `Prolog`, `Haskell`.