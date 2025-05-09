/*
Arbol_binario
a(1, a(2,nil,nil), a(3,nil,nil))

        1
      /    \
    2        3
    
*/


/*
Induccion:
1) P(n0).  n0 en arboles binarios es nil
2) n > n0, P(n-1) -> P(n)

*/

arbol1(
        a(1, a(2,nil,nil), a(3,nil,nil))
        ).
        
arbol2(
        a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
        ).

/* 
cuenta_nodos(+Arbol_binario, ?Num_nodos)
es cierto cuando Num_nodos unifica con el
numero de nodos del árbol "Arbol_binario" 
*/

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, AI, AD), R):- cuenta_nodos(AI, RI), cuenta_nodos(AD, RD), R is RI + RD + 1.

/*
crea_arbol(Lista. Arbol_binario)
es cierto cuando Arbol_binario unifica con un arbol binerio balanceado
que contiene todas las etiquetas de la Lista.

*/

/* length  y append son reversibles */

crea_arbol([], nil).
crea_arbol([Cab|Resto], a(Cab, A1, A2)):- length(Resto, L), Med is L div 2, length(L1, Med), append(L1, L2, Resto),
        crea_arbol(L1, A1), crea_arbol(L2, A2).


/*
balanceado(Arbol)
es cierto si "para todo nodo del arbol" la diferencia entre la altura
del subarbol Izq y el subarbol Der sea como maximo 1.

*/

balanceado(nil).
balanceado(a(_, AI, AD)):- altura(AI, RI), altura(AD, RD), D is abs(RI - RD), D =< 1, balanceado(AI), balanceado(AD).


/*
altura(Arbol, A)
es cierto si A unifica con la altura de un arbol_binario.

*/

altura(nil, 0).
altura(a(_, AI, AD), A):- altura(AI, Ai), altura(AD, Ad), Alt is max(Ai, Ad), A is Alt + 1.


/*
suma_nodos(Arbol_binario, R)
es cierto si R unifica con la suma de todas las etiquetas de un arbol_binario.

*/

suma_nodos(nil, 0).
suma_nodos(a(E, AI, AD), R):- suma_nodos(AI, RI), suma_nodos(AD, RD), R is RI + RD + E.


/*
miembro(Elem, Arbol_binario)
es cierto si Elem unifica es una etiqueta de un arbol_binario.

*/

miembro(E, a(E, _, _)).
miembro(Elem, a(_, AI, _)):- miembro(Elem, AI).
miembro(Elem, a(_, _, AD)):- miembro(Elem, AD).


/*
Recorridos:
inorden(Arbol_binario, Recorrido)
es cierto si Recorrido unifica con las etiquetas del arbol recoridas en inorden

preorden(Arbol_binario, Recorrido)
es cierto si Recorrido unifica con las etiquetas del arbol recoridas en preorden

postorden(Arbol_binario, Recorrido)
es cierto si Recorrido unifica con las etiquetas del arbol recoridas en postorden

*/

inorden(nil, []).
inorden(a(E, AI, AD), R):- inorden(AI, RI), inorden(AD, RD), append([RI, [E], RD], R).

preorden(nil, []).
preorden(a(E, AI, AD), R):- preorden(AI, RI), preorden(AD, RD), append([E|RI], RD, R).

postorden(nil, []).
postorden(a(E, AI, AD), R):- postorden(AI, RI), postorden(AD, RD), append([RI, RD, [E]], R).

































