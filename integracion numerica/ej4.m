clear
clc

N = 1e6;

f = {
  @(x) sin(x),
  @(x) x.*sin(x),
  @(x) x.^2.*sin(x)
};


A = zeros(3);
b = zeros(3, 1);
for i = 1:length(f)
  b(i) = trapecio(f{i}, 0, pi, N);
  A(i, 1) = f{i}(pi/6);
  A(i, 2) = f{i}(pi/2);
  A(i, 3) = f{i}(5*pi/6);
endfor

w = A \ b;
disp("Los pesos son: ");
disp([w]);

% funcion del ejercicio
fr = @(x) x.^3 .* sin(x);
intfr = w(1)*fr(pi/6) + w(2)*fr(pi/2) + w(3)*fr(5*pi/6);
err = intfr - (pi^3 - (6*pi));
printf("La integral es: %d; el error es: %.2e\n", intfr, err);

