leap(Y):- Y mod 4 =:= 0, Y mod 100 =\= 0.
leap(Y):- Y mod 100 =:= 0, Y mod 400 =:= 0.
