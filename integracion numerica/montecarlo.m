function q = montecarlo (N)
  f = @(x) sqrt(1-x.^2);
  % caja [0, 1] × [0, 1]
  X = rand(1, N);
  Y = rand(1, N);
  area = 1;
  N0 = sum(Y < f(X)); % suma los puntos debajo de la grafica
  q = (N0/N) * area;
endfunction

