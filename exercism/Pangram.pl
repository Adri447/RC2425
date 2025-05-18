

lista_alfabeto(
['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
).

contiene_letra(Lista, Letra):- member(Letra, Lista).

pangram(Sentence):- string_lower(Sentence, Lower), string_chars(Lower, Lista),
    lista_alfabeto(Alfabeto), maplist(contiene_letra(Lista), Alfabeto).
