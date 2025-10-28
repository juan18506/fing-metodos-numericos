clc
clear

syms x;
p = (1/x) - pi;
px = diff(p, x);
f = matlabFunction(p);
fx = matlabFunction(px);
% Elegir x0 tq 0 < x0 < 1/pi
x0 = 0.1;
raiz = newton(f, fx, 0.15);
printf("La raiz es: %d\n", raiz);

