printf("\nf(x)= 4*x^3  + x + cos(x) - 10 = 0\n");
a = 1;
b = 2;

%printf("\nf(x)= exp(x) - pi()^x + 25 = 0\n");
%a = 3;
%b = 4;

%printf("\nf(x)= x^4  - 6*x^3  + 8*x^2  + 6*x - 9 = 0\n");
%a = 0;
%b = 2;

Toler = 10^-6;
IterMax = 100;

printf("\nMétodo da Bisseção\n");
a
b
Toler
IterMax
[Raiz, Iter, Info] = bissecao(a, b, Toler, IterMax, @fa);
Raiz
Iter
Info

printf("\nMétodo de Newton-Raphson\n");
x = (a + b) / 2;
x
Toler
IterMax
[Raiz, Iter, Info] = newton_raphson(x, Toler, IterMax, @fa, @dfa);
Raiz
Iter
Info

