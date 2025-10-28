clear
clc

function raiz = newton_sistema(f, J, x0, tol, iter)
  it = 0;
  xk = x0;
  crit_parada = false;
  while !crit_parada && it < iter
    dk = J(xk) \ (-f(xk));
    if norm(dk) <= tol * norm(xk)
      crit_parada = true;
    endif
    xk = xk + dk;
    it += 1;
  endwhile
  raiz = xk;
endfunction

f = @(v) [
  v(1)^2 + v(2)^2 - 9;
  (3 * (v(1)^2) * v(2)) - v(2)^3 - 4
];
J = @(v) [
  2*v(1),      2*v(2);
  6*v(1)*v(2), 3*v(1)^2-3*v(2)^2
];
tol = 10e-12;
iter = 100;
raices = horzcat(
  newton_sistema(f, J, [2; 0], tol, iter),
  newton_sistema(f, J, [2; 2], tol, iter),
  newton_sistema(f, J, [-2; 0], tol, iter),
  newton_sistema(f, J, [-2; 2], tol, iter)
)

% Grafico
% Rango de interés
x = linspace(-4, 4, 200);
y = linspace(-4, 4, 200);
[X, Y] = meshgrid(x, y);

% Funciones
F1 = X.^2 + Y.^2 - 9;
F2 = 3*X.^2 .* Y - Y.^3 - 4;

figure;
hold on;
contour(X, Y, F1, [0 0], 'r', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'b', 'LineWidth', 2);
for i = 1:length(raices)
    plot(raices(1,i), raices(2,i), 'ks', 'MarkerFaceColor', 'k');
end
xlabel('x');
ylabel('y');
title('Curvas de nivel 0 de f(x,y) y g(x,y)');

