function [t, Y] = euler_explicito (f, t0, tf, y0, h)
  n = floor((tf-t0)/h);
  t = zeros(1, n+1);
  m = length(y0);
  Y = zeros(m, n);
  t(1) = t0;
  Y(:, 1) = y0;
  for i = 1:n
    t(i+1) = t(i)+h;
    Y(:, i+1) = Y(:, i) + h*f(t(i), Y(:, i));
  endfor
endfunction
