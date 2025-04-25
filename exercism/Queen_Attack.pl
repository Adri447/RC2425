%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).
create((DimX, DimY)):- DimX >= 0, DimY >= 0, DimX < 8, DimY < 8. 

%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.
attack((FromX, FromY), (ToX, ToY)):- create((FromX, FromY)), create((ToX, ToY)), FromX == ToX.
attack((FromX, FromY), (ToX, ToY)):- create((FromX, FromY)), create((ToX, ToY)), FromY == ToY.

attack((FromX, FromY), (ToX, ToY)):- create((FromX, FromY)), create((ToX, ToY)), 
    diagonal((FromX, FromY), (ToX, ToY)).

diagonal((FromX, FromY), (ToX, ToY)):- abs(FromX - ToX) =:= abs(FromY - ToY).
