

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
Ei = estado(0,0).
Ef = estado(_,4).
3. definir los movimientos
*/

mov(llenar_3, estado(_,L5), estado(3,L5)).
mov(llenar_5, estado(L3,_), estado(L3,5)).
mov(vaciar_3, estado(_,L5), estado(0,L5)).
mov(vaciar_5, estado(L3,_), estado(L3,0)).
mov(pasar_3a5, estado(L3,L5), estado(0,Suma)):- Suma is L3 + L5, Suma =< 5.
mov(pasar_3a5, estado(L3,L5), estado(Resto,5)):- Suma is L3 + L5, Suma > 5, Resto is Suma - 5.
mov(pasar_5a3, estado(L3,L5), estado(Suma,0)):- Suma is L3 + L5, Suma =< 3.
mov(pasar_5a3, estado(L3,L5), estado(3,Resto)):- Suma is L3 + L5, Suma > 3, Resto is Suma - 3.



/*
4. Camino desde estado inicial al final
camino(Ei, Ef, Visitados, Camino)

*/

camino(Ei, Ei, _, []).
camino(Ei, Ef, Visitados, [Mov|Camino]):- 
  length(Visitados, L), L < 7,
  mov(Mov, Ei, TMP), 
  \+ member(TMP, Visitados),
  camino(TMP, Ef, [TMP|Visitados], Camino).


inicial(estado(0,0)).
final(estado(_,4)).

solucion(Camino):- inicial(Ei), final(Ef), camino(Ei, Ef,[Ei], Camino).


/*
Misioneros y canibales

Problemas de estados
1. definir el estado
  estado(MI, CI, Balsa).

2. definir estado inicial y final
  Ei = estado(3,3,D).
  Ef = esatdo(0,0,I).

3. definir los movimientos
    pasar((M,C,Lado), E_anterior, E_siguiente).
    
4. Camino desde estado inicial al final
*/

set_prolog_flag(answer_write_options, [max_depth(0)]).

/* estado(Canibales_izq, Misioneros_izq, Pos_barca) */
inicial(estado(3,3,izq)).
final(estado(0,0,dch)).

/* pasar(?Num_misioneros, ?Num_canibales, ?Lugar)
 es cierto cuando Num_misioneros y Num_canibales unifica con una combinación
válida de misioneros y canibales válida según la especificación del problema y
cuando lugar unifica con ‘izq’ o ‘dch’. 
*/

pasar(1,0,izq).
pasar(1,0,dch).
pasar(1,1,izq).
pasar(1,1,dch).
pasar(0,1,izq).
pasar(0,1,dch).
pasar(2,0,izq).
pasar(2,0,dch).
pasar(0,2,izq).
pasar(0,2,dch).

/* mov(?Movimiento, ?Estado_anterior, ?Estado_posterior)
 es cierto cuando Movimiento unifica con un Movimiento válido, Estado_anterior
unifica con un estado válido y Estado_posterior unifica con el estado resultante
de aplicar el movimiento “Movimiento” al estado “Estado_anterior” */

mov(pasar(M, C, izq), estado(MI,CI, dch), estado(MD, CD, izq)):-
 pasar(M,C,izq),
 NT is M + C, NT =< 2, NT >= 1,
 M =< MI, C =< CI,
 MD is MI + M, CD is CI + C.
 
mov(pasar(M, C, dch), estado(MI, CI, izq), estado(MD, CD, dch)):-
 pasar(M,C,dch),
 NT is M + C, NT =< 2, NT >= 1,
 M =< MI, C =< CI,
 MD is MI -M, CD is CI - C.

 
 
/* camino(+Estado_inicial, +Estado_final, +Visitados, -Camino)
  es cierto cuando Estado_inicial y Estado_final unifican con estados válido, Visitados unifica con una lista
*/

camino(Inicio, Inicio, _, []).
camino(Inicio, Fin, Visitados, [Mov|Camino]):-
 length(Visitados, L), L < 10,
 mov(Mov, Inicio, Int),
 \+ member(Int, Visitados),
 camino(Int, Fin, [Int|Visitados], Camino).

 
solucion(Camino):- inicial(Ei), final(Ef), camino(Ei, Ef,[Ei], Camino).
