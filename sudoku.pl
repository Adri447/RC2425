/*

sudoku(Matrix).
  es cierto si Matrix unifica con una matriz 9x9 casillas,      16
  con los números del 1 al 9,                                   17
  dividido en 9 bloques de 3x3 casillas,                        21
  con números distintos or fila,                                18
  columnas                                                      20
  y por cada bloque 3x3

*/


sudoku(Rows):-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]):-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).
