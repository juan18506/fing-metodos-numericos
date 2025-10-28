clear
clc

syms x;
a = 2;
p = sign(x - a) * sqrt(abs(x - a));
f = matlabFunction(p);
raiz = secante(f, 1/a, 2*a);
printf('La raiz es %d, y por secante da: %d\n', a, raiz);

