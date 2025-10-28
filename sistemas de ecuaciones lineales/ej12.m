clear
clc

P = [
  0.5, 0.2, 0.2, 0.1;
  0.3, 0.4, 0.2, 0.1;
  0.2, 0.3, 0.4, 0.1;
  0.1, 0.1, 0.2, 0.6;
];

I = eye(4); % identidad 4x4
A = I - P'; % P' es la traspuesta de P
A(4,:) = [1 1 1 1]; % reemprazo la ultima fila por x1 + x2 + x3 + x4 = 1
b = [0; 0; 0; 1]; % lado derecho

x = A \ b;

pi = x'; % vector fila π = x traspuesta

disp('pi * P = ')
disp(pi * P)

disp('Diferencia pi*P - pi = ')
disp((pi * P) - pi)   % debe ser del orden 10⁻¹⁶ o similar

disp('Suma de entradas de pi = ')
suma = 0;
for p = pi
  suma += p;
endfor
disp(suma)

disp('Entradas no negativas?')
noneg = true;
for p = pi
  if p < 0
    noneg = false;
  endif
endfor
disp(noneg)

