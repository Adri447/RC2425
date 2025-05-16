

/*
Problemas de estados
1. definir el estado
2. definir estado inicial y final
3. definir los movimientos
4. Camino desde estado inicial al final (Lista de movimientos)

*/

/*
Problema de las jarras

1. definir el estado
estado(L3,L5).
2. definir estado inicial y final
E_ini = estado(0,0).
E_Fin = estado(_,4).
3. definir los movimientos
mov(llenar_3, estado(_,L5), estado(3,L5)).
mov(llenar_5, estado(L3,_), estado(L3,5)).
mov(vaciar_3, estado(_,L5), estado(0,L5)).
mov(vaciar_5, estado(L3,_), estado(L3,0)).
mov(pasar_3a5, estado(L3,L5), estado(0,Suma)):- Suma is L3 + L5, Suma =< 5.
mov(pasar_3a5, estado(L3,L5), estado(Resto,5)):- Suma is L3 + L5, Suma > 5, Resto is Suma - 5.
mov(pasar_5a3, estado(L3,L5), estado(Suma,0)):- Suma is L3 + L5, Suma =< 3.
mov(pasar_5a3, estado(L3,L5), estado(3,Resto)):- Suma is L3 + L5, Suma > 3, Resto is Suma - 3.
4. Camino desde estado inicial al final
camino(Ei, Ef, Visitados, Camino)

camino(Ei, Ei, _, []).
camino(Ei, Ef, Visitados, [Mov|Camino]):- 
  mov(Mov, Ei, TMP), 
  \+ member(TMP, Visitados),
  camino(TMP, Ef, [TMP|Visitados], Camino).

*/





/*
Misioneros y canibales

Problemas de estados
1. definir el estado
  estado(MI, CI, Balsa).

2. definir estado inicial y final
  E_ini = estado(3,3,D).
  E_Fin = esatdo(0,0,I).

3. definir los movimientos
    pasar((M,C,Lado), E_anterior, E_siguiente).

4. Camino desde estado inicial al final


*/
