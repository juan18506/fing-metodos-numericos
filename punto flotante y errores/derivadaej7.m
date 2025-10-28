clear
clc

f = @(x) sin(5*x);
a = 1;
der1 = 5*cos(5*a);
der3 = -125*cos(5*a);

k = 0:20;
h = (0.1).^k

ders = (f(a+h) - f(a-h)) ./ (2*h);
errs_abs = abs(ders-der1)
errs_teo = ((eps ./ (2*h)) * abs(f(a))) + (((h.^2)/6) * (abs(der3)))

h_optimo = nthroot((3*eps*abs(f(a))) / (2*abs(der3)), 3)
loglog(h, errs_abs, 'r', h, errs_teo, 'b');
