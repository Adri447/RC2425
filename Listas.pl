/*
Listas:
n0 = [], [_] < [_,_]

[Cabeza|Resto] = [1,2,3,4].
Cabeza tiene el primero -> Cabeza = [1], Resto = [2,3,4]
*/

/*
my_length(list, Num)
 es cierto si Num unifica con el numero de elementos de List.
*/

my_Length([], 0).
my_Length([_|Resto], N):- R is N-1, my_Length(Resto, R).

/*
elemento_enesimo(+Lista, +Pos, -Elem)
  es cierto cuando Elem unifica con el elemento de la posición Pos en de Lista.
*/

elemento_enesimo([Cab|_], 1, Cab).
elemento_enesimo([_|Resto], N, R):- N > 1, N2 is N-1, elemento_enesimo(Resto, N2, R).

/*
my_reverse(?List, ?ListR) 
  es cierto cuando ListR unifica con una lista que contiene los mismos elementos que List pero en orden inverso.
*/

my_reverse([],[]).
my_reverse([Cab|Resto], R2):- my_reverse(Resto, R), append(R, [Cab], R2).


/*
aniadir_final(+Elem, +Lista, -ListaR) 
cierto cuando ListaR unifica con una lista que contiene los mismos elementos que la lista Lista más 
el elemento Elem añadido al final.
*/

aniadir_final(Elem, [], [Elem]).
aniadir_final(Elem, Lista, R):- append(Lista, [Elem], R).


/*
my_append(?Lita1, ?Lista2, ?Resultado)
 es cierto si Resultado unifica con una lista que contiene los elemetos de Lista1 y Lista2.
 
my_append([1,2,3],[4,5],R).
R = [1,2,3,4,5]
*/

my_append([], Lista, Lista).
my_append([Cab|Resto], Lista, [Cab|R]):- my_append(Resto, Lista, R).



/*
mas_veces(+Lista, -Elem, -Num)
 es cierto cuando Elem unifica con el elemento que se repite más veces en la 
 lista Lista y Num unifica con el número de veces que se repite dicho elemento.

1) Ordeno
2) Comprime
3) maximo
*/

mas_veces(Lista, E, N):- msort(Lista, L), comprime(L, R), maximo(R, E, N).

/*
comprime(Lista, R)
 es cierto si R unifica con la lista que contiene los elementos de Lista con el siguiente formato:
 comprime([a,a,a,b,b,c,a,a], R).
 R = [(a,3),(b,2),(c,1),(a,2)]
*/

comprime([],[]).
comprime([E], [(E,1)]).
comprime([C1,C1|Resto], [(C1,N2)|R]):- comprime([C1|Resto], [(C1,N)|R]), N2 is N + 1.
comprime([C1,C2|Resto], [(C1,1)|R]):- C1\=C2, comprime([C2|Resto], R).


/*
maximo(Lista, E, N)
 es cierto si E unifica con el elemento de Lista que se repite mas veces y N el numero de veces que se repite,
 conteniendo L una Lista de tuplas con los elementos y el numero de veces que se repite. Si la lista es vacia N vale -1
*/

maximo([], _, -1).
maximo([(Cab,N)|Resto], Cab, N):- maximo(Resto, Emayor, Nmayor), N > Nmayor.
maximo([(Cab,N)|Resto], Emayor, Nmayor):- maximo(Resto, Emayor, Nmayor), N =< Nmayor.




/*
permuta(Lista, ListaR).
 es cierto cuando ListaR unifica con una lista que contiene los elementos de Lista en orden
 distinto. Este predicado genera todas las listas posibles por backtraking.

selecciona_uno(+Lista, -Elem, -Resto)
 es cierto cuando Elem unifica con cualquier elemento de la lista Lista y Resto unifica
 con una lista que contiene los elementos de Lista, en el mismo orden menos el elemento Elem.
*/

permuta([],[]).
permuta(Lista, [E|R]):- selecciona_uno(Lista, E, Resto), permuta(Resto, R).

selecciona_uno([Cab|Resto], Cab, Resto).
selecciona_uno([Cab|Resto], E, [Cab|R]):- selecciona_uno(Resto, E, R). 




/* primosEntrexy(+X, +Y, -ListaR)
 es cierto cuando ListaR unifica con una lista que contiene a los primos que van desde X hasta
 Y ambos incluidos en orden ascendente.
*/

primosEntrexy(X,X,[]).
primosEntrexy(X,Y, [X|R]):- X<Y, X2 is X+1, primosEntrexy(X2,Y, R), primo(X).
primosEntrexy(X,Y, R):- X<Y, X2 is X+1, primosEntrexy(X2, Y, R), \+ primo(X).


/* primo(X)
   es cierto si X unifica con un número primo.
*/
primo(X):- lista_divisores(X,X,[X,1]).


/* lista_divisores(+X, +Y, -ListaR).
 es cierto cuando ListaR unifica con una lista que contiene a los números cuyo resto
 de la división entera de X entre Z es igual a 0 para valores de Z entre 1 e Y.
*/
lista_divisores(_, 1, [1]).
lista_divisores(X, Y, [Y|R]):- Y > 1, Y2 is Y-1, lista_divisores(X, Y2, R), 0 is X mod Y.
lista_divisores(X, Y, R):- Y > 1, Y2 is Y-1, lista_divisores(X,Y2, R), Z is X mod Y, Z \== 0.




/* Ordenacion por iserción */
ordena_insercion([],[]).
ordena_insercion([Cab|Resto], R2):- ordena_insercion(Resto, R), inserta_en_list_ordenada(Cab, R, R2).

inserta_en_list_ordenada(Elem, [], [Elem]).
inserta_en_list_ordenada(Elem, [Cab|Resto], [Elem,Cab|Resto]):-  Elem =< Cab.
inserta_en_list_ordenada(Elem, [Cab|Resto], [Cab|R]):-  Elem > Cab, inserta_en_list_ordenada(Elem, Resto, R).



/* Ordenacion por burbuja (pillar elementos consecutivos)*/
ordena_burbuja(Lista, Lista):- ordenada(Lista).
ordena_burbuja(Lista, R2):- append(L1, [E1,E2|L2], Lista), E1 > E2, append(L1, [E2,E1|L2], R), ordena_burbuja(R, R2).
ordena_burbuja(Lista, R2):- append(L1, [E1,E2|L2], Lista), E1 =< E2, append(L1, [E1,E2|L2], R), ordena_burbuja(R, R2).

ordenada([]).
ordenada([_]).
ordenada([C1,C2|Resto]):- C1 =< C2, ordenada([C2|Resto]).


/* Ordenacion Quicksort */
ordena_quick([],[]).
ordena_quick([Cab|Resto], R):- divide(Cab, Resto, Men, May), ordena_quick(Men, RMen), 
                               ordena_quick(May, RMay), append(RMen, [Cab|RMay], R).

divide(_, [], [], []).
divide(Pivote, [Cab|Resto], [Cab|RMen], RMay):- Cab =< Pivote, divide(Pivote, Resto, RMen, RMay).
divide(Pivote, [Cab|Resto], RMen, [Cab|RMay]):- Cab > Pivote, divide(Pivote, Resto, RMen, RMay).










