
/*
Grafos

g(Listavertices, ListaAristas)

g([a,b,c,d], [a(a,b),a(c,d),a(a,c),a(c,d)])

a _ b
| /
c _ d

*/


/*
Ini ---- Arista ---- TMP --- Camino ---- FIN

Formas de representar el camino:
1. Lista de Vertices
2. Lista de Aristas

Casos mas sencillos:
1. inicio = Fin
2. Existe Arista entre Ini y Fin

Lista de visitados.
1. Lista de Aristas
2. Lista de Vertices

Tipo de Grafo:
1. Dirigido
2. No dirigido

Induccion:
1) P(n0).
  1.a) camino(Grafo, Ini, Ini, ).
  1.b) camino(Grafo, Ini, Fin, ):- arista(Ini, Fin, Grafo).
*/

/*

1) camino: No, Dirigido, Lista de Vertices, Visitados = Vertices, N0 -> Ini = Fin
camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
  es cierto si camino unifica con ua lista de vertices para llegar 
  desde Ini hasta Fin sin repetir vertices visitados en el grafo g

*/

1)
camino(_, Ini, Ini, _, [Ini]).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  camino(g(Vertices, Aristas), TMP, Fin, [TMP|Visitados], Camino),
  


/*
conectado(Grafo, A, B)

si esta dirigio es 
conectado(g(_, Aristas), Ini, Fin):- member(a(Ini,Fin), Aristas).
si no es dirigido hay que añadir
conectado(g(_, Aristas), Ini, Fin):- member(a(Fin,Ini), Aristas).

*/

conectado(g(_, Aristas), Ini, Fin):- member(a(Ini,Fin), Aristas).
conectado(g(_, Aristas), Ini, Fin):- member(a(Fin,Ini), Aristas).


