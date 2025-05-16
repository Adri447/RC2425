sublist([], [], equal).

        

          

sublist(Lista, Lista, equal).

        

          


        

          

sublist([Cab1|Lista1], [Cab2|Lista2], unequal):- Cab1 \= Cab2.

        

          

sublist([Cab|Lista1], [Cab|Lista2], unequal):- sublist(Lista1, Lista2, unequal).

        

          


        

          


        

          

sublist(Lista1, Lista2, superlist):- append([_, Lista2, _], Lista1).

        

          

sublist(Lista1, Lista2, sublist):- append([_, Lista1, _], Lista2).

        

          
