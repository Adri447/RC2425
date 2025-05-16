square(1, 1).
square(SquareNumber, Value):- SquareNumber =< 64, SquareNumber > 1, N is SquareNumber - 1, 
    square(N, R), Value is R*2.
    
square_list(1, 1, [1]).
square_list(SquareNumber, R2, [R2|Lista]):- SquareNumber =< 64, SquareNumber > 1, N is SquareNumber - 1,
    square_list(N, R, Lista), R2 is R*2.
    
total(Value):- square_list(64, _, Lista), sum_list(Lista, Value).
