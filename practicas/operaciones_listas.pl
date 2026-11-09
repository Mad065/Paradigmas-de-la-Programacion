% =========================================================
% Práctica 6: Operaciones con Listas en Prolog
% Paradigmas de la Programación - ESCOM
% Autor: José Antonio Martínez Castañón
% =========================================================

% =========================================================
% 1. IMPRIMIR UNA LISTA
% =========================================================
% Procedimiento que imprime cada elemento de una lista en
% forma vertical.

% Caso base: si la lista está vacía, el proceso termina con éxito.
imprime([]).

% Caso recursivo: imprime la cabeza (H), hace un salto de línea (nl)
% y llama recursivamente al procedimiento con la cola (T).
imprime([H|T]) :-
    write(H),
    nl,
    imprime(T).

% =========================================================
% 2. INSERTAR UN ELEMENTO AL INICIO DE LA LISTA
% =========================================================
% Procedimiento que toma un elemento y lo unifica como la
% nueva cabeza de una lista.

% Al elemento X se le concatena la lista existente para formar la nueva.
insertari(X, Lista, [X|Lista]).

% =========================================================
% 3. INSERTAR UN ELEMENTO AL FINAL DE LA LISTA
% =========================================================
% Procedimiento que recorre la lista hasta el final para
% agregar el nuevo elemento.

% Caso base: insertar un elemento X en una lista vacía da como
% resultado una lista que contiene únicamente a X.
insertarf(X, [], [X]).

% Caso recursivo: se mantiene la cabeza (H) en la nueva lista y se
% llama recursivamente hasta llegar a la cola vacía.
insertarf(X, [H|T], [H|T_Nueva]) :-
    insertarf(X, T, T_Nueva).

% =========================================================
% 4. CONSULTAS DE VERIFICACIÓN (Ejemplos del pizarrón)
% =========================================================
%
% --- 1. Imprimir lista ---
% ?- imprime([a,b,c,d]).
% a
% b
% c
% d
% true.
%
% --- 2. Insertar al inicio ---
% ?- insertari(tierra, [aire,fuego], L).
% L = [tierra, aire, fuego].
%
% --- 3. Insertar al final ---
% ?- insertarf(fuego, [agua,tierra], L).
% L = [agua, tierra, fuego].
