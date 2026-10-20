% =========================================================
% Práctica 5: Base de Conocimientos en Prolog (Árbol Genealógico)
% Paradigmas de la Programación - ESCOM
% Autor: José Antonio Martínez Castañón
% =========================================================

% =========================================================
% 1. HECHOS
% =========================================================

% Hombres y mujeres
hombre(eduardo).
hombre(francisco).
hombre(luis).
hombre(mario).

mujer(alicia).
mujer(veronica).
mujer(victoria).
mujer(beatriz).

% Relación padres(Hijo/a, Padre, Madre)
padres(eduardo, francisco, victoria).
padres(alicia, francisco, victoria).
padres(luis, eduardo, veronica).
padres(beatriz, mario, alicia).

% Relación esposos(Esposo, Esposa)
esposos(eduardo, veronica).
esposos(mario, alicia).
esposos(francisco, victoria).

% =========================================================
% 2. REGLAS
% =========================================================

% Reglas de hermandad
hermana(Ella, X) :- mujer(Ella), padres(Ella, P, M), padres(X, P, M).
hermano(El, X) :- hombre(El), padres(El, P, M), padres(X, P, M).

% Reglas de descendencia (hijo varón)
hijo(El, X) :- hombre(El), padres(El, X, _).
hijo(El, X) :- hombre(El), padres(El, _, X).

% Reglas de descendencia (hija mujer - Inciso B)
% - La primera regla valida que Ella sea mujer y que X sea su padre (2.º argumento de padres/3).
% - La segunda regla valida que Ella sea mujer y que X sea su madre (3.er argumento de padres/3).
hija(Ella, X) :- mujer(Ella), padres(Ella, X, _).
hija(Ella, X) :- mujer(Ella), padres(Ella, _, X).

% =========================================================
% 3. INCISO A: ÁRBOL GENEALÓGICO
% =========================================================
% 1.ª Generación (Abuelos): Francisco y Victoria están casados.
% 2.ª Generación (Hijos / Tíos): Eduardo y Alicia son hijos de Francisco y Victoria.
%                                Eduardo se casa con Verónica, y Alicia con Mario.
% 3.ª Generación (Nietos / Primos): Luis es hijo de Eduardo y Verónica;
%                                   Beatriz es hija de Mario y Alicia.
%
%                   [Francisco] ═════ [Victoria]
%                                 │
%                ┌────────────────┴────────────────┐
%                ▼                                 ▼
% [Verónica] ═════ [Eduardo]            [Alicia] ═════ [Mario]
%        │                                      │
%        ▼                                      ▼
%      [Luis]                                [Beatriz]
%
% (Leyenda: ═════ representa matrimonio; │ / ▼ representa descendencia directa).

% =========================================================
% 4. INCISO C: CONSULTAS DE VERIFICACIÓN
% =========================================================
%
% --- Consultas booleanas (true / false) ---
% ?- hija(alicia, francisco).    % true  (Alicia es hija de Francisco)
% ?- hija(veronica, francisco).  % false (Verónica no es hija de Francisco)
% ?- hijo(eduardo, victoria).    % true  (Eduardo es hijo de Victoria)
% ?- hijo(mario, francisco).     % false (Mario no es hijo de Francisco)
% ?- hermana(alicia, eduardo).   % true  (Alicia es hermana de Eduardo)
% ?- hermano(luis, beatriz).     % false (Luis y Beatriz no son hermanos)
% ?- esposos(eduardo, veronica). % true  (Eduardo y Verónica son esposos)
% ?- esposos(mario, victoria).   % false (Mario no está casado con Victoria)
%
% --- Consultas con variables libres ---
% 1. ¿Quién es hija de Francisco?
%    ?- hija(Hija, francisco).
%    Hija = alicia.
%
% 2. ¿De quiénes es hija Beatriz?
%    ?- hija(beatriz, Progenitor).
%    Progenitor = mario ;
%    Progenitor = alicia.
%
% 3. ¿Quién es el hijo de Verónica?
%    ?- hijo(Hijo, veronica).
%    Hijo = luis.
%
% 4. ¿Quién es el hermano de Alicia?
%    ?- hermano(Hermano, alicia).
%    Hermano = eduardo.
%
% 5. ¿Quiénes son los padres de Luis?
%    ?- padres(luis, Padre, Madre).
%    Padre = eduardo,
%    Madre = veronica.

