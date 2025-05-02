hamming_distance(Str1, Str2, Dist):- string_chars(Str1, List1), string_chars(Str2, List2), distance(List1, List2, Dist).

distance([], [], 0).
distance([Cab1|Resto1], [Cab2|Resto2], R):- Cab1\=Cab2, distance(Resto1, Resto2, Res), R is Res + 1.
distance([Cab1|Resto1], [Cab2|Resto2], R):- Cab1 == Cab2, distance(Resto1, Resto2, R).
