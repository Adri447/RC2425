
/*
triangle(A, B, C, R)
 es cierto si R unifica con equilateral y 
 A, B, C corresponden a la longitud de un triangulo equilatero
 
 es cierto si R unifica con isosceles y 
 A, B, C corresponden a la longitud de un triangulo isosceles
 
 es cierto si R unifica con scalene y 
 A, B, C corresponden a la longitud de un triangulo escaleno
 
a + b ≥ c
b + c ≥ a
a + c ≥ b

triangle(A, B, C) 
 es cierto si a b y c corresponden a las longitudes de los lados de un triangulo
*/

triangle(A, B, C):- A + B >= C, A + C >= B, B + C >= A, A > 0, B > 0, C > 0.

equilatero(A, B, C):- A == B, B == C, A == C.
escaleno(A, B, C):- A \= B, B \= C, C \= A.
isosceles(A, B, C):- A == B.
isosceles(A, B, C):- C == B.
isosceles(A, B, C):- A == C.

triangle(A, B, C, R):- triangle(A, B, C), equilatero(A, B, C), R == "equilateral".
triangle(A, B, C, R):- triangle(A, B, C), isosceles(A, B, C), R == "isosceles".
triangle(A, B, C, R):- triangle(A, B, C), escaleno(A, B, C), R == "scalene".
