clear
clc

function ret = f(x)
  ret = sin(x) * (exp(x) - 1);
endfunction

function ret = g(x)
  ret = exp(x);
endfunction

a = 0; % en el intervalo [0, 5]
b = 5;
alfa = 0; % y(a) = alfa
beta = sin(5); % y(b) = beta

N = 50; % cantidad de subintervalos
h = (b-a)/N; % tamanio de subintervalos

% arreglo de puntos de subdivision [1..N-1]
x = zeros(1, N-1);
for i = 1:N-1
  x(i) = a + (i*h);
endfor

% inicializar A y b_sol -> Ax = b_sol
A = zeros(N-1, N-1);
b_sol = zeros(N-1, 1);

% rellenar A y b_sol
for i = 1:N-1
    xi = x(i); % subdivision i del intervalo [0..5]
    gi = g(xi);
    fi = f(xi);

    % calculo del valor de la digonal
    A(i,i) = (gi * (h^2)) - 2;

    % A es tridiagonal con los valores fuera de la diagonal en 1
    % los ifs cubren los casos para no irse de rango
    if i > 1
        A(i, i-1) = 1;
    endif
    if i < N-1
        A(i, i+1) = 1;
    endif

    % calculo b_sol
    b_sol(i) = fi * (h^2);
    % dado que tenemos y(a)=alfa y y(b)=beta para 1 y N-1 tenemos que
    % en y(a+h) aparece y(a) que no es incognita y lo mismo en y(a+(N-1*h))
    % donde aparece y(b), para despejar las incognitas las pasamos restando
    if i == 1
        b_sol(i) = b_sol(i) - alfa;
    endif
    if i == N-1
        b_sol(i) = b_sol(i) - beta;
    endif
endfor

% calculamos el sistema de ecuaciones que es nuestra aproximacion y luego
% tomamos los valores exactos dados por la letra
y_techo = A \ b_sol;
y = sin(x);

% grafico la estimacion en azul y los valores exactos en rojo
plot(x, y_techo, 'bo', 'DisplayName', 'Aproximación numérica')
hold on
plot(x, y, 'r', 'DisplayName', 'Solución exacta')
legend show

