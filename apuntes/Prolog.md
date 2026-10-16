# Apuntes: Prolog y Programación Lógica

**Prolog** (*PROgramming in LOGic*) es el lenguaje representativo del **paradigma de programación lógica y declarativa**. A diferencia de los lenguajes imperativos, donde se especifica *cómo* resolver un problema paso a paso, en Prolog se describe *qué* es verdadero mediante hechos y reglas lógicas, y el motor de inferencia deduce las respuestas automáticamente.

---

## 1. Introducción a Prolog y el Paradigma Lógico

**Prolog** fue creado a principios de los años 70 (1972) por **Alain Colmerauer** y **Philippe Roussel** en la Universidad de Marsella, junto con las bases teóricas de **Robert Kowalski** sobre la resolución mediante cláusulas de Horn (lógica de primer orden).

### Características principales:
* **Declarativo**: El programa es una **Base de Conocimiento** (*Knowledge Base*) compuesta por hechos y reglas.
* **Motor de Inferencia**: Utiliza **Unificación** (emparejamiento de patrones) y **Resolución SLD** con **Backtracking** (retroceso automático) para encontrar soluciones.
* **Hipótesis del Mundo Cerrado (*Closed World Assumption*)**: Todo aquello que no se pueda demostrar como verdadero a partir de la base de conocimiento se asume como falso (`false`).

---

## 2. Sintaxis y Tipos de Términos

En Prolog, todas las estructuras de datos y los programas mismos se construyen a partir de **términos** (*terms*), y **toda instrucción termina obligatoriamente con un punto (`.`)**.

### Tipos de Términos:
1. **Átomos** (Constantes simbólicas):
   * Comienzan con **letra minúscula** (Ej. `socrates`, `juan`, `agua`, `es_mortal`).
   * O cualquier texto encerrado entre **comillas simples** si lleva mayúsculas o espacios (Ej. `'Juan Perez'`, `'Ciudad de México'`).
2. **Números**: Enteros (`42`, `-7`) y Flotantes (`3.1416`).
3. **Variables**:
   * Comienzan SIEMPRE con **letra MAYÚSCULA** o con guion bajo `_` (Ej. `X`, `Persona`, `Resultado`, `_Temp`).
   * **Variable Anónima (`_`)**: Se usa como comodín ("no me importa este valor"). Cada aparición de `_` representa una variable distinta.
4. **Términos Compuestos (Estructuras / Functores)**:
   * Tienen un nombre (functor) y uno o más argumentos entre paréntesis: `nombre(arg1, arg2)`.
   * Su **aridad** es el número de argumentos que recibe y se escribe como `nombre/aridad` (Ej. `padre/2` indica que `padre` recibe 2 argumentos).

### Comentarios
```prolog
% Comentario de una sola línea (inicia con porcentaje)

/* 
   Comentario de múltiples líneas
   estilo C
*/
```

---

## 3. Los Tres Pilares de Prolog

Un programa en Prolog se compone de tres elementos fundamentales:

### 1. Hechos (*Facts*)
Expresan relaciones o propiedades que son incondicionalmente verdaderas.
```prolog
humano(socrates).          % Sócrates es humano (aridad 1: humano/1)
padre(juan, maria).        % Juan es padre de María (aridad 2: padre/2)
padre(juan, pedro).        % Juan es padre de Pedro
padre(pedro, luis).        % Pedro es padre de Luis
```

### 2. Reglas (*Rules*)
Definen nuevas relaciones condicionales usando el operador de implicación inversa `:-` (que se lee como **"si"** o **"se cumple si"**).
Sintaxis: `Cabeza :- Cuerpo.` (La `Cabeza` es verdadera si el `Cuerpo` es verdadero).

* **Coma (`,`)**: Conjunción lógica (**AND**).
* **Punto y coma (`;`)**: Disyunción lógica (**OR**).
* **Negación por fallo (`\+`)**: Verdadero si la meta no puede probarse (**NOT**).

```prolog
% X es mortal SI X es humano
mortal(X) :- humano(X).

% X es abuelo de Y SI X es padre de Z Y Z es padre de Y
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).

% X e Y son hermanos SI tienen el mismo padre P y X es diferente de Y
hermanos(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
```

### 3. Consultas (*Queries*)
Son preguntas que se hacen en la consola interactiva (`?-`) para que Prolog busque respuestas en la base de conocimiento:

```prolog
?- mortal(socrates).
true.

?- padre(juan, Hijo).
Hijo = maria ;     % Presionar ';' pide a Prolog buscar la siguiente solución
Hijo = pedro.

?- abuelo(Abuelo, luis).
Abuelo = juan.
```

---

## 4. Unificación y Backtracking

### Unificación (`=`)
Es el proceso mediante el cual Prolog intenta hacer que dos términos sean idénticos instanciando variables si es necesario:
```prolog
?- X = socrates.
X = socrates.

?- punto(X, 10) = punto(5, Y).
X = 5,
Y = 10.
```

### Backtracking (Retroceso)
Cuando una consulta tiene múltiples caminos posibles o una condición falla, Prolog retrocede automáticamente al último punto de decisión (*choice point*) y prueba la siguiente alternativa disponible en la base de conocimiento.

---

## 5. Aritmética y Operadores de Comparación

> [!IMPORTANT]
> En Prolog, el signo `=` **NO evalúa operaciones matemáticas**, solo unifica estructuras. Si escribes `X = 2 + 3`, `X` valdrá la expresión literal `2+3`, no `5`. Para evaluar expresiones matemáticas se utiliza el operador **`is`**.

### Evaluación Aritmética con `is`
La variable a la derecha de `is` debe tener ya un valor numérico conocido (estar instanciada):
```prolog
?- X is 2 + 3 * 4.
X = 14.

% Ejemplo: Conversión de Celsius a Fahrenheit
celsius_a_fahrenheit(C, F) :-
    F is (C * 9 / 5) + 32.
```

### Operadores Matemáticos y Relacionales
| Operador | Significado | Ejemplo |
| :--- | :--- | :--- |
| `+`, `-`, `*`, `/` | Suma, resta, multiplicación, división flotante | `X is 10 / 4` (`2.5`) |
| `//`, `mod` | División entera y módulo (residuo) | `X is 10 mod 3` (`1`) |
| `**` o `^` | Potencia | `X is 2 ** 3` (`8`) |
| `is` | Evalúa la expresión derecha y la unifica con la izquierda | `R is X + 1` |
| `=:=` | Igualdad **aritmética** (evalúa ambos lados) | `2 + 3 =:= 4 + 1` (`true`) |
| `=\=` | Desigualdad **aritmética** | `5 =\= 3` (`true`) |
| `=` / `\=` | Unificación / No unificable (sin evaluar matemáticas) | `a \= b` (`true`) |
| `<`, `>`, `=<`, `>=` | Menor, mayor, menor o igual (`=<`), mayor o igual | `X >= 0` |

> [!WARNING]
> En Prolog, "menor o igual" se escribe **`=<`** (y no `<=`, ya que `<=` parece una flecha lógica).

---

## 6. Listas en Prolog

Las listas se representan entre corchetes `[1, 2, 3, 4]`. La lista vacía es `[]`.
Para descomponer una lista en su **Cabeza** (primer elemento, equivalente al `car` de Lisp) y su **Cola** (resto de la lista, equivalente al `cdr` de Lisp), se usa el operador barra vertical `|`:

```prolog
% Formato: [Cabeza | Cola]
?- [Cabeza | Cola] = [agua, papel, dinero, tierra].
Cabeza = agua,
Cola = [papel, dinero, tierra].

% También se pueden extraer varios elementos iniciales a la vez:
?- [Primero, Segundo | Resto] = [agua, papel, dinero, tierra].
Primero = agua,
Segundo = papel,
Resto = [dinero, tierra].
```

### Predicados predefinidos útiles para listas:
* `member(Elemento, Lista)`: Verifica si `Elemento` pertenece a `Lista` o genera sus elementos.
* `append(Lista1, Lista2, Resultado)`: Concatena dos listas.
* `length(Lista, Longitud)`: Calcula la cantidad de elementos de `Lista`.
* `nth0(Indice, Lista, Elemento)`: Extrae el elemento en el índice dado (empezando en `0`, igual que `nth` en Lisp).
* `nth1(Indice, Lista, Elemento)`: Extrae el elemento en el índice dado (empezando en `1`).

---

## 7. Recursión en Prolog

Dado que en Prolog puro no existen bucles iterativos como `for` o `while`, toda repetición o recorrido de estructuras se realiza mediante **recursión**, definiendo siempre:
1. **Caso base** (un hecho o regla que detiene la recursión).
2. **Caso recursivo** (una regla que reduce el problema y se llama a sí misma).

### Ejemplo 1: Relaciones transitivas (`ancestro/2`)
```prolog
% Caso base: X es ancestro de Y si X es padre directo de Y
ancestro(X, Y) :- padre(X, Y).

% Caso recursivo: X es ancestro de Y si X es padre de Z y Z es ancestro de Y
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).
```

### Ejemplo 2: Factorial de un número (`factorial/2`)
```prolog
% Caso base: el factorial de 0 es 1
factorial(0, 1).

% Caso recursivo: N! = N * (N-1)!
factorial(N, Resultado) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, SubResultado),
    Resultado is N * SubResultado.
```

### Ejemplo 3: Sumar los elementos de una lista (`suma_lista/2`)
```prolog
% Caso base: la suma de la lista vacía es 0
suma_lista([], 0).

% Caso recursivo: sumar la Cabeza al resultado de sumar la Cola
suma_lista([Cabeza | Cola], Total) :-
    suma_lista(Cola, SumaCola),
    Total is Cabeza + SumaCola.
```

---

## 8. Control de Búsqueda (`!`) y Entrada/Salida

### El Operador de Corte (`!`)
El signo de exclamación `!` (*cut*) se utiliza para podar el árbol de búsqueda: le indica a Prolog que, una vez alcanzado ese punto, **no intente hacer backtracking** hacia alternativas anteriores de esa regla.
```prolog
% Clasificar un número usando corte para evitar evaluaciones innecesarias
clasificar(N, negativo) :- N < 0, !.
clasificar(0, cero)     :- !.
clasificar(N, positivo) :- N > 0.
```

### Entrada y Salida en Consola
```prolog
saludar :-
    write('¿Cuál es tu nombre? '),   % Imprime texto en consola
    read(Nombre),                    % Lee un término terminado en punto (ej. juan.)
    format('¡Hola, ~w!~n', [Nombre]). % ~w imprime el término, ~n es salto de línea
```
* `write(X)`: Imprime el valor de `X`.
* `nl`: Imprime un salto de línea (*newline*).
* `writeln(X)`: Imprime `X` seguido de un salto de línea.
* `format('Texto ~w ~n', [Args])`: Salida con formato (similar a `format` en Lisp).

---

## 9. Cómo Ejecutar Programas en SWI-Prolog

1. Guarda tu código en un archivo con extensión `.pl` (por ejemplo, `practica.pl`).
2. Inicia el intérprete en la terminal ejecutando `swipl`.
3. Carga el archivo dentro de `?-`:
   ```prolog
   ?- [practica].
   % o también:
   ?- consult('practica.pl').
   ```
   *(También puedes cargarlo directamente desde la terminal del sistema con `swipl -s practica.pl`)*.
4. Para recargar cambios hechos al archivo: `?- make.`
5. Para salir del intérprete de Prolog: `?- halt.`

---

## 10. Documentación y Referencias Recomendadas

* **[SWI-Prolog Official Documentation & Manual](https://www.swi-prolog.org/pldoc/doc_for?object=manual)**: La documentación oficial más completa del estándar de facto de Prolog (incluye buscador de todos los predicados integrados).
* **[Learn Prolog Now!](https://www.learnprolognow.org/)**: El mejor curso y libro interactivo gratuito en línea para aprender Prolog desde cero paso a paso.
* **[SWISH — SWI-Prolog for Sharing](https://swish.swi-prolog.org/)**: Entorno interactivo en el navegador para escribir, probar y compartir código Prolog sin instalar nada, con cuadernos de ejemplos.
* **[The Power of Prolog (Markus Triska)](https://www.metalevel.at/prolog)**: Guía moderna y profunda sobre programación lógica en Prolog, recursión, listas y restricciones (CLP).
* **[P-99: Ninety-Nine Prolog Problems](https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/)**: Colección clásica de 99 ejercicios resueltos de listas, aritmética y lógica para practicar Prolog.
