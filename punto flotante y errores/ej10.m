clear
clc

% Parte B
n = 30;
recurrencia = ones(1, n+1); % I0 -> recurrencia(1)
recurrencia(1) = log(6/5);

% In = 5*In-1 + 1/n
for i = 2:n+1
   recurrencia(i) = (1/n) - 5*recurrencia(i-1);
endfor
disp('I30 calculado hacia adelante: ');
disp(recurrencia(n+1));

% Parte C
n = 100;
aproximaciones_iniciales = [0, 0.1, 1];
for aprox = aproximaciones_iniciales
  recurrencia = ones(1, n);
  recurrencia(n) = aprox;

  % In-1 = 1/5 (1/n - In)
  for i = 1:n-1
     recurrencia(n-i) = ((1/(n-i)) - recurrencia(n+1-i)) / 5;
  endfor
  disp(['I30 calculado hacia atras con I100 = ', num2str(recurrencia(n))]);
  disp(recurrencia(30));
endfor
