clear
clc

v = [0, 10, 20, 30, 40, 50, 60];
d = [0, 5, 20, 46, 70, 102, 153];

dlineal = @(x) interp1(v, d, x, 'linear') - 60;
dcubica = @(x) interp1(v, d, x, 'cubic') - 60;
dspline = @(x) interp1(v, d, x, 'spline') - 60;

vel_max_lin = biseccion(dlineal, 30, 40)
vel_max_cub = biseccion(dcubica, 30, 40)
vel_max_spl = biseccion(dspline, 30, 40)

hold on;
fplot(dlineal, [0, 60]);
fplot(dcubica, [0, 60]);
fplot(dspline, [0, 60]);
x = linspace(0, 60, 100);
plot(x, zeros(size(x)));
