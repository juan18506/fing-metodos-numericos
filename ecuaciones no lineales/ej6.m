clear
clc

function retval = largo_maximo (l1, l2, y)
  func_a = @(a) ((l2 * cos(pi-y-a)) / (sin(pi-y-a)^2)) - ((l1 * cos(a)) / (sin(a)^2));
  a = biseccion(func_a, 0, pi-y);
  retval = (l2 / sin(pi-y-a)) + (l1 / sin(a));
endfunction

function retval = minimo_y (l1, l2, largo)
  func_y = @(y) largo_maximo(l1, l2, y) - largo;
  retval = biseccion(func_y, 0, pi);
endfunction

function retval = anchos (y, largo)
  func_l1 = @(l1) largo_maximo(l1, 2*l1, y) - largo;
  l1 = biseccion(func_l1, 0, pi);
  l2 = 2 * l1;
  retval = [l1, l2];
endfunction

parte_a = largo_maximo(1, 1.5, (3*pi)/5)
parte_b = minimo_y(1, 1.5, 5)
parte_c = anchos(pi/2, 3)

