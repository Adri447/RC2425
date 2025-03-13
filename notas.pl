
% Natural

/*
natural(N)
  es cierto si N es un número natural.

Principio de Inducción Matemática

 Queremos demostrar que una propiedad P es cierta para
 todos los elementos del conjunto S. 
 
 Precondición: Los elementos de S tienen que ser ordenables 
 (Tendré un elemento n0 que será el más pequeño).

1) P(n0) es cierto.
2) Para todo n > n0:
   Si P(n-1) es cierta, entonces P(n)
   Si P(n) es cierta, entonces P(n+1)
   
   Si natural(N-1) -> natural(N).

*/

natural(1).
natural(N):- N > 1, N2 is N-1, natural(N2).


/*
 En prolog le damos la vuelta a las reglas.
 A -> B
 B :- A.
*/


/*
Listas:
n0 = [], [_] < [_,_]

[Cabeza|Resto] = [1,2,3,4].
Cabeza tiene el primero

my_length(list, Num)
 es cierto si Num unifica con el numero de elementos de List.
 
*/

my_Length([], 0).
my_Length([_|Resto], N):- R is N-1, my_Length(Resto, R).


/*
comprime(Lista, R)
 es cierto si R unifica con la lista si:
 comprime([a,a,a,b,b,c,a,a], R).
 R = [(a,3),(b,2),(c,1),(a,2)]
 
*/


/*
elemento_enesimo(+Lista, +Pos, -Elem)
  es cierto cuando Elem unifica con el elemento de la posición Pos en de Lista.

*/

elemento_enesimo([Cab|_], 1, Cab).
elemento_enesimo([_|Resto], N, R):- N > 1, N2 is N-1, elemento_enesimo(Resto, N2, R)







/*
Arbol
nil,

Grafo
vacio
*/
