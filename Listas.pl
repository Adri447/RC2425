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
my_append(?Lita1,?Lista2, ?Resultado)
 es cierto si Resultado unifica con una lista que contiene los elemetos de Lista1 y Lista2.
 
my_append([1,2,3],[4,5],R).
R = [1,2,3,4,5]
*/

my_append([],Lista,Lista).
my_append([Cab|Resto],Lista, [Cab|R]):- my_append(Resto,Lista,R).


/*
comprime(Lista, R)
 es cierto si R unifica con la lista si:
 comprime([a,a,a,b,b,c,a,a], R).
 R = [(a,3),(b,2),(c,1),(a,2)]
*/




