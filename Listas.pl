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

aniadir_final(Elem,[],[Elem]).
aniadir_final(Elem,Lista,R):- append(Lista, [Elem], R).


/*
my_append(?Lita1,?Lista2, ?Resultado)
 es cierto si Resultado unifica con una lista que contiene los elemetos de Lista1 y Lista2.
 
my_append([1,2,3],[4,5],R).
R = [1,2,3,4,5]
*/

my_append([], Lista, Lista).
my_append([Cab|Resto], Lista, [Cab|R]):- my_append(Resto, Lista, R).


/*
comprime(Lista, R)
 es cierto si R unifica con la lista si:
 comprime([a,a,a,b,b,c,a,a], R).
 R = [(a,3),(b,2),(c,1),(a,2)]
 
cuenta_repetidos(Elem, Lista, N, Resto)
 N es la cantidad de veces que Elem aparece al principio de Lista + 1
 Resto es la lista que queda después de contar los repetidos
*/

comprime([],[]).
comprime([X|Xs], [(X,N)|R]):- cuenta_repetidos(X, Xs, N, Resto), comprime(Resto, R).

cuenta_repetidos(_, [], 1, []).
cuenta_repetidos(X, [X|Xs], N, Resto):- cuenta_repetidos(X, Xs, N1, Resto), N is N1 + 1.
cuenta_repetidos(X, [Y|Ys], 1, [Y|Ys]):- X \= Y.


/*
mas_veces(+Lista, -Elem, -Num)
 es cierto cuando Elem unifica con el elemento que se repite más veces en la 
 lista Lista y Num unifica con el número de veces que se repite dicho elemento.
*/

mas_veces([], _, 0).
mas_veces([Elem|Resto], Elem, N2):- mas_veces(Resto, Elem, N), N2 is N + 1. 
mas_veces([Cab|Resto], Elem, N):- mas_veces(Resto, Elem, N), Cab\=Elem. 



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







/* Ordenacion por iserción */
ordena_insercion([],[]).
ordena_insercion([Cab|Resto], R2):- ordena_insercion(Resto, R), inserta_en_list_ordenada(Cab, R, R2).

inserta_en_list_ordenada(Elem, [], [Elem]).
inserta_en_list_ordenada(Elem, [Cab|Resto], [Elem,Cab|Resto]):-  Elem =< Cab.
inserta_en_list_ordenada(Elem, [Cab|Resto], [Cab|R]):-  Elem > Cab, inserta_en_list_ordenada(Elem, Resto, R).


/* Ordenacion Quicksort */

ordena_quick([],[]).
ordena_quick([Cab|Resto], R):- divide(Cab, Resto, Men, May), ordena_quick(Men, RMen), ordena_quick(May, RMay), append(RMen, [Cab|RMay], R).

divide(Pivote, [], [], []).
divide(Pivote, [Cab|Resto], [Cab|RMen], RMay):- Pivote =< Cab, divide(Pivote, Resto, RMen, RMay).
divide(Pivote, [Cab|Resto], RMen, [Cab|RMay]):- Pivote > Cab, divide(Pivote, Resto, RMen, RMay).










