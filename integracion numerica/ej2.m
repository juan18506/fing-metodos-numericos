clear
clc

% devuelve nodos para facilitar el grafico de los nodos de f(x) y g(t)
function [q, nodos] = trapecio (f, a, b, N)
  h = (b-a)/N;
  nodos = a + h*(1:N-1);
  q = h*(1/2 * f(a) + sum(f(nodos)) + 1/2 * f(b));
endfunction

f = @(x) e.^x./sqrt(x);
g = @(t) 2*e.^(t.^2);
I = 2.9253;
Ns = [1e2, 1e3, 1e4, 1e5, 1e6];

disp('Parte A');
for N = Ns
  QT = trapecio(f, 1e-10, 1, N);
  error = QT - I;
  printf('Aplicar QT(f) para N = %.0e da = %d y tiene error = %.3e\n', N, QT, error);
endfor

disp('');
disp('Parte B');
for N = Ns
  QT = trapecio(g, 1e-5, 1, N);
  error = QT - I;
  printf('Aplicar QT(g) para N = %.0e da = %.5d y tiene error = %.3e\n', N, QT, error);
endfor

% grafico la derivada segunda de f
figure;
title('Segunda derivada de f(x) en (0, 1]')
xlabel('x');
ylabel('f''''(x)');
f2 = @(x) e.^x .* (1./(x.^(1/2)) - 1./(x.^(3/2)) + 3./(4*x.^(5/2)));
nodos = linspace(1e-10, 1, 500);
plot(nodos, f2(nodos), 'b', 'LineWidth', 2);
hold on;
% grafico 1e3 nodos de g(x) equiespaciados en x
[QT, nodos] = trapecio(f, 1e-10, 1, 1e3);
plot(nodos, zeros(size(nodos)), '|', 'MarkerSize', 15, 'Color', 'r');
% grafico 1e3 nodos de g(t) equiespaciados en t, deshaciendo el CV t->x
[QT, nodos] = trapecio(g, 1e-5, 1, 1e3);
nodos = nodos.^2;
plot(nodos, zeros(size(nodos)), '|', 'MarkerSize', 15, 'Color', 'g');
legend('f''''(x)', 'Nodos de f(x) (equiespaciados en x)', 'Nodos de g(t) (CV t->x)', 'FontSize', 14);

