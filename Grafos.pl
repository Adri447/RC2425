
/*
Grafos

g(Listavertices, ListaAristas)

g([a,b,c,d], [a(a,b),a(c,d),a(a,c),a(c,d)])

a _ b
| /
c _ d

*/

grafo1(
	g([a,b,c,d], [a(a,b),a(b,c),a(a,c),a(c,d)])
	).

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

1) camino: No Dirigido, Lista de Vertices, Visitados = Vertices, N0 -> Ini = Fin
camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
  es cierto si camino unifica con ua lista de vertices para llegar 
  desde Ini hasta Fin sin repetir vertices visitados en el grafo g

*/

camino(_, Ini, Ini, _, [Ini]).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  \+ member(TMP, Visitados),
  camino(g(Vertices, Aristas), TMP, Fin, [TMP|Visitados], Camino).
  

/*
conectado(Grafo, A, B)

si esta dirigio es 
conectado(g(_, Aristas), Ini, Fin):- member(a(Ini,Fin), Aristas).
si no es dirigido hay que añadir
conectado(g(_, Aristas), Ini, Fin):- member(a(Fin,Ini), Aristas).

*/

conectado(g(_, Aristas), Ini, Fin):- member(a(Ini,Fin), Aristas).
conectado(g(_, Aristas), Ini, Fin):- member(a(Fin,Ini), Aristas).


grafo2(
	g([a,b,c,d,e], [a(a,b),a(a,c),a(b,c),a(c,e),a(c,d),a(b,d),a(d,e),a(b,e)])
	).

/*
Ejercicio de la casa sin pasar por la arista mas de un vez
2) camino: No Dirigido, Lista de Aristas, Visitados = Ariatas, N0 -> Existe Arista entre Ini y Fin
camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
  es cierto si camino unifica con ua lista de Aristas para llegar 
  desde Ini hasta Fin sin repetir Aristas visitadas en el grafo g

*/

camino(G, Ini, Fin, _, []):- conectado(G, Ini, Fin).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [a(Ini,TMP)|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  \+ member(a(Ini,TMP), Visitados),
  camino(g(Vertices, Aristas), TMP, Fin, [a(Ini,TMP),a(TMP,Ini)|Visitados], Camino).



/*
Obtener todos los ciclos de un grafo
*/

camino(G, Ini, Fin, Visitados, [a(Ini,Fin)]):- \+ member(a(Ini,Fin), Visitados), conectado(G, Ini, Fin).
camino(g(Vertices, Aristas), Ini, Fin, Visitados, [a(Ini,TMP)|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  \+ member(a(Ini,TMP), Visitados),
  camino(g(Vertices, Aristas), TMP, Fin, [a(Ini,TMP),a(TMP,Ini)|Visitados], Camino).


/*
Supongo que el grafo es dirigido, el camino es una lista de vertices y los isitados es una lista de aristas
*/

camindo(_, Ini, Ini, _, [Ini]).
camino(grafo(V, A), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(Ini, TMP, A),
  \+ member(a(Ini,TMP), Visitados),
  camino(grafo(V, A), TMP, Fin, [a(Ini,TMP)|Visitados], Camino).

ciclo(grafo(V, A), Ciclo):- member(Vertice, V), camino(grafo(V, A), Vertice, Vertice, [], Ciclo), length(Ciclo, L), L > 1.
ciclos(G, R):- bagof(C, ciclo(G, C), R).



  

