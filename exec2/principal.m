a = 2;
b = 5;
m = 6;

printf("\nSolução da integral \int_%d^%d 1/(x * log_e (x)) dx com m = %d\n", a, b, m);

n = 1;
printf("\nRegra do trapézio\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fa);
Integral
Info

n = 2;
printf("\nRegra do 1/3 de Simpson\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fa);
Integral
Info

n = 3;
printf("\nRegra dos 3/8 de Simpson\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fa);
Integral
Info

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = 0;
b = pi();
m = 12;

printf("\nSolução da integral \int_%d^%d sen(x)/exp(x - 1) dx com m = %d\n", a, b, m);

n = 1;
printf("\nRegra do trapézio\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fb);
Integral
Info

n = 2;
printf("\nRegra do 1/3 de Simpson\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fb);
Integral
Info

n = 3;
printf("\nRegra dos 3/8 de Simpson\n");
[Integral, Info] = newton_cotes(a, b, n, m, @fb);
Integral
Info

