
square_root(Number, SquareRoot):- Number >= 0, RootFloat is sqrt(Number), SquareRoot is round(RootFloat), SquareRoot * SquareRoot =:= Number.
