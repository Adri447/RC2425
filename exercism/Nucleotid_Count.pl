
valido('A').
valido('C').
valido('G').
valido('T').


nucleotide_count(DNA, Resultado):- string_chars(DNA, Lista), maplist(valido, Lista),
    count('A', Lista, N1), count('C', Lista, N2), count('G', Lista, N3), count('T', Lista, N4),
    Resultado = [('A',N1), ('C',N2), ('G',N3), ('T',N4)].

    
count(_, [], 0).
count(X, [X|Resto], R):- count(X, Resto, N), R is N + 1.
count(X, [Cab|Resto], N):- Cab \= X, count(X, Resto, N).
