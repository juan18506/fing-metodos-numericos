clear
clc

syms x;
p = 816*x^3-3835*x^2+6000*x-3125;
raices = double(solve(p, x));
f = matlabFunction(p);
fx = matlabFunction(diff(p, x));

hold on;
fplot(f, [1.43, 1.71]);
x = linspace(1.43, 1.71, 100);
plot(x, zeros(size(x)));
plot(raices, f(raices), 'ks');

raiz_newton = newton(f, fx, 1.5);
raiz_secante = secante(f, 1, 2);
raiz_biseccion = biseccion(f, 1, 2);
printf('El metodo de newton en x⁰=1.5 devuelve %d\n', raiz_newton);
printf('El metodo de la secante en x⁰=1 y x1=2 devuelve %d\n', raiz_secante);
printf('El metodo de biseccion en [1, 2] devuelve %d\n', raiz_biseccion);

