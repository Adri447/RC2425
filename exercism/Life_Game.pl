:- use_module(library(clpfd)).

/*
obtener vecindario
*/
select(Matrix, X, R):- length(Matrix, LM), N1 is X - 1, N12 is max(0, N1),
    length(L1, N12), N3 is LM - (X + 2), N32 is max(0, N3),
    length(L3, N32), append([L1, R, L3], Matrix).

neighbors(Matrix, X, Y, List):- select(Matrix, Y, Rows), transpose(Rows, Cols),
    select(Cols, X, R), transpose(R, R2), append(R2, List).

pos(M, X, Y, Pos):- nth0(Y, M, Row), nth0(X, Row, Pos).

tick(M, X, Y, 1):- pos(M, X, Y, 1), neighbors(M, X, Y, List), 
                    sum_list(List, Sum), Sum2 is Sum - 1, Sum2 >= 2, Sum2 =< 3.
                    
tick(M, X, Y, 1):- pos(M, X, Y, 0), neighbors(M, X, Y, List), 
                    sum_list(List, Sum), Sum == 3.
                    
tick(M, X, Y, 0):- pos(M, X, Y, 1), neighbors(M, X, Y, List), 
                    sum_list(List, Sum), Sum2 is Sum - 1, Sum2 < 2.

tick(M, X, Y, 0):- pos(M, X, Y, 1), neighbors(M, X, Y, List), 
                    sum_list(List, Sum), Sum2 is Sum - 1, Sum2 > 3.

tick(M, X, Y, 0):- pos(M, X, Y, 0), neighbors(M, X, Y, List), 
                    sum_list(List, Sum), Sum \= 3.

tick([], []). 
tick(M, R):- length(M, L), equis(L, X), maplist(tick(M), X, R).
tick(M, Row, R):- length(M, L), equis(L, L2), ies(Row, L, L3), maplist(tick(M), L2, L3, R).

equis(N, R):- populate(N, R2), reverse(R2, R).

populate(0, []).  
populate(N, [N2|R]):- N > 0, N2 is N - 1, populate(N2, R).

ies(_, 0, []).
ies(N, L, [N|R]):- L > 0, L2 is L-1, ies(N, L2, R).

