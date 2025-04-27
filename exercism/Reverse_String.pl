string_reverse(S, Reversed):- string_chars(S, List), reverse(List, R), string_chars(Reversed, R).

reverse([], []).
reverse([Cab|Resto], Rt):- reverse(Resto, R), append(R, [Cab], Rt).
