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
        a(1, a(2, a(4, nil, nil), a(5, nil, nil)), 
             a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
        ).

/* 
cuenta_nodos(+Arbol_binario, ?Num_nodos)
es cierto cuando Num_nodos unifica con el numero de nodos del árbol Arbol_binario 
*/

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, AI, AD), R):- cuenta_nodos(AI, RI), cuenta_nodos(AD, RD), R is RI + RD + 1.


/* 
cuenta_internos(+Arbol_binario, ?Num_internos)
es cierto cuando Num_internos unifica con el numero de nodos internos del árbol Arbol_binario 
*/

cuenta_internos(a(_, AI, AD), 0):- hoja(a(_,AI,AD)).
cuenta_internos(a(_, AI, nil), R):- AI \= nil, cuenta_internos(AI, RI), R is RI + 1.
cuenta_internos(a(_, nil, AD), R):- AD \= nil, cuenta_internos(AD, RD), R is RD + 1.
cuenta_internos(a(_, AI, AD), R):- \+ hoja(a(_, AI, AD)), cuenta_internos(AI, RI), cuenta_internos(AD, RD), R is RI + RD + 1.

hoja(a(_,nil,nil)).



/* 
cuenta_hojas(+Arbol_binario, ?Num_hojas)
es cierto cuando Num_hojas unifica con el numero de nodos hoja del árbol Arbol_binario 
*/

cuenta_hojas(a(_, AI, AD), 1):- hoja(a(_,AI,AD)).
cuenta_hojas(a(_, AI, nil), RI):- AI \= nil, cuenta_hojas(AI, RI).
cuenta_hojas(a(_, nil, AD), RD):- AD \= nil, cuenta_hojas(AD, RD).
cuenta_hojas(a(_, AI, AD), R):- \+ hoja(a(_, AI, AD)), cuenta_hojas(AI, RI), cuenta_hojas(AD, RD), R is RI + RD.

hoja(a(_,nil,nil)).



/* lista_hojas(+Arbol_binario, ?Lista_hojas)
 es cierto cuando Lista_hojas unifica con una lista que contiene 
 las etiquetas de las hojas del árbol “Arbol_binario”
*/

lista_hojas(nil,[]).
lista_hojas(a(E,nil,nil),[E]).
lista_hojas(a(_, HI, HD), L):- \+ hoja(a(_, HI, HD)), lista_hojas(HI,LI), lista_hojas(HD,LD), append(LI,LD,L).

hoja(a(_,nil,nil)).



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
iguales(A1, A2)
 es cierto si los arboles binerios/genericos son iguales
*/

iguales(A,A).


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



/*
insertar(E, A, NA)
inserta el elemento E en el árbol A, retornando el nuevo árbol en NA
*/

insertar(E, nil, a(E, nil, nil)).
insertar(E, a(C, AI, AD), a(C, AI, RD)):- E > C, insertar(E, AD, RD).
insertar(E, a(C, AI, AD), a(C, RI, AD)):- E =< C, insertar(E, AI, RI).













/*
Arbol generico
a(1,[a(2,[a(5,[])]), a(3,[]), a(4,[])])

                1
           /    |    \
           2    3     4
           |
           5

n0 = a(_,[]).

*/

dato(a(a,[a(f,[a(g,[])]),a(c,[]),a(b,[a(d,[]),a(e,[])])])).

cuenta_nodos(a(_, ListaHijos), R):- cuenta_nodos(ListaHijos, RLH), R is RLH + 1.

cuenta_nodos([], 0).
cuenta_nodos([Cab|Resto], R):- cuenta_nodos(Resto, RR), cuenta_nodos(Cab, RC), R is RR + RC


/*
lista_hojas_ag(+ArbolGenerico, ?Lista_hojas)
es cierto cuando Lista_hojas unifica con una lista que contiene las etiquetas de las hojas del ArbolGenerico
*/

hoja_ag(a(_, [])).
etiqueta(a(Et, _), Et).
lista_hijos(a(_,LH), LH). 

lista_hojas_ag(A, [Et]):- hoja_ag(A), etiqueta(A, Et).
lista_hojas_ag(A, R):- \+ hoja_ag(A), lista_hijos(A, ListaHijos), lista_hojas(ListaHijos, R).
  
lista_hojas([], []).
lista_hojas([Cab|Resto], R):- lista_hojas_ag(Cab, RCa), lista_hojas(Resto, RR), append(RCa, RR, R).

    

/*
construye_arbol_generico(Lista, arbolG)
 es cierto si arbolG unifica con un arbol generico que contiene todas las etiquetas de Lista
*/

construye_arbol_generico([Cab|Resto], a(Cab, R)):- construye_lista_arboles_generico(Resto, R).

construye_lista_arboles_generico([], []).
construye_lista_arboles_generico([Cab|Resto], [a(Cab,[])|R]):- construye_lista_arboles_generico(Resto, R).


/*
profundidad_ag(+Arbol_generico, ?P)
 es cierto cuando P unifica con la profundidad del
 árbol genérico “Arbol_genérico”
*/

profundidad_ag(a(_,ListaHijos), N):- profundidad_ag(ListaHijos, R), N is R + 1.


profundidad_ag([],0).
profundidad_ag([Cab|Resto], PR):- profundidad_ag(Cab, PC), profundidad_ag(Resto, PR), PC =< PR.
profundidad_ag([Cab|Resto], PC):- profundidad_ag(Cab, PC), profundidad_ag(Resto, PR), PC > PR.



/*
bin2gen(Arbol_binario, Arbol_generico)
es cierto si arbol_generico unifica con un arbl_binario

*/

bin2gen(a(E, nil, nil),a(E,[])).
bin2gen(a(E, nil, AD),a(E,[AGD])):- AD \= nil, bin2gen(AD, AGD).
bin2gen(a(E, AI, nil),a(E,[AGI])):- AI \= nil, bin2gen(AI, AGI).
bin2gen(a(E, AI, AD),a(E,[AGI, AGD])):- bin2gen(AI, AGI), bin2gen(AD, AGD).


/*
anchura(Arbol_generico, Recorrido)
es cierto si Recorrido unifica con las etiquetas del arbol recoridas en anchura

*/

anchura(a(E, ListaHijos), [E|R]):- anchura(ListaHijos, R).
anchura([],[]).
anchura([a(E, ListaHijos)|Resto], [E|R2]):- append(Resto, ListaHijos, R), anchura(R, R2).
































