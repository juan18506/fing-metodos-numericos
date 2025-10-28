clear
clc

x = 1;
pasos = 0;

while 1+x > 1
  x = x/2
  pasos += 1;
  pause(.02);
end

disp(['La cantidad de pasos es: ', num2str(pasos)]);

x = 1;
pasos = 0;

while x+x > x
  x = 2*x
  pasos += 1;
  pause(.02);
end

disp(['La cantidad de pasos es: ', num2str(pasos)]);

x = 1;
pasos = 0;

while x+x > x
  x = x/2
  pasos += 1;
  pause(.02);
end

disp(['La cantidad de pasos es: ', num2str(pasos)]);
