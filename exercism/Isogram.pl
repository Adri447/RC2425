
/*
isogram(String).
  es cierto si la cadena String contiene caracteres diferentes
  excepto los espacios en blanco y los guiones.

string_lower(+String, string).
string_codes(?String, ?Codes).

quita_blancos(Lista, R).
  es cierto si R unifica con una lista de números que contiene Lista
  eliminando las ocurrencias de 32 y 45 (" " y "-").
  
*/

blanco(32).
blanco(45).

quita_blancos(String, R):-  exclude(blanco, Codes, R), string_lower(String, string), string_codes(string, Codes).

isogram(String):- maplist(all_distinct(R)), quita_blancos(String, R).



