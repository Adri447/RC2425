

flatten_list([], []).

flatten_list([Cab|Resto], [Cab|R]):- \+ is_list(Cab), flatten_list(Resto, R).
flatten_list([Cab|Resto], R):- is_list(Cab), flatten_list(Cab, R1), flatten_list(Resto, R2), append(R1, R2, R).

flatten_list([nil|Resto], R):- flatten_list(Resto, R).
