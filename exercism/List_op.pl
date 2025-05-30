
custom_length([], 0).
custom_length([Cab|Resto], Length):- custom_length(Resto, L1), Length is L1 + 1.

custom_append([], [], []).
custom_append(L1, L2, Appended):- append(L1, L2, Appended).

custom_concat([], []).
custom_concat([Cab|Resto], Concatenated):- is_list(Cab), custom_concat(Resto, R), append(Cab, R, Concatenated).

custom_reverse([], []).
custom_reverse([Cab|Resto], Reversed):- custom_reverse(Resto, R), append(R, [Cab], Reversed).


custom_map(Goal, List, Mapped):- maplist(Goal, List, Mapped).


custom_filter(_, [], []).
custom_filter(Goal, [Cab|Resto], [Cab|Filtered]):- call(Goal, Cab), custom_filter(Goal, Resto, Filtered).
custom_filter(Goal, [_|Resto], Filtered):- custom_filter(Goal, Resto, Filtered).


custom_foldl(_, State, [], State).
custom_foldl(Goal, State, [Cab|Resto], Folded):- call(Goal, State, Cab, S1), custom_foldl(Goal, S1, Resto, Folded).

custom_foldr(_, [], State, State).
custom_foldr(Goal, [Cab|Resto], State, Folded):- custom_foldr(Goal, Resto, State, S1), call(Goal, Cab, S1, Folded).
