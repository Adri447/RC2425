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


/* 
cuenta_nodos(+Arbol_binario, ?Num_nodos)
es cierto cuando Num_nodos unifica con el
numero de nodos del árbol "Arbol_binario" 
*/

cuenta_nodos(nil, 0).
cuenta_nodos(a(_, AI, AD), R):- cuenta_nodos(AI, RI), cuenta_nodos(AD, RD), R is RI + RD + 1.
