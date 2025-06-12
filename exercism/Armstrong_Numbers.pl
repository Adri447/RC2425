
armstrong_number(N):- number_to_chars(N, C), chars_to_numbers(C, Lista), length(Lista, Potencia),
    maplist(potencia(Potencia), Lista, R), sum_list(R,N).
    
potencia(Pow, N, R):- R is N ^ Pow.

chars_to_numbers([], []).
chars_to_numbers([Cab|Resto], [C|R]):- chars_to_numbers(Resto, R), number_to_chars(C, [Cab]).
