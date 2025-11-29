function [t, Y] = euler_implicito (f, df, t0, tf, y0, h)
  n = floor((tf-t0)/h);
  t = zeros(1, n+1);
  m = length(y0);
  Y = zeros(m, n+1);
  t(1) = t0;
  Y(:, 1) = y0;

  max_iter = 20;
  tol = 1e-5;
  for i = 1:n
    t(i+1) = t(i)+h;
    iter = 0;
    Yaux = Y(:, i);
    Yaux_prev = Yaux + 10*tol;
    while norm(Yaux-Yaux_prev) > tol && iter < max_iter
      iter += 1;
      Yaux_prev = Yaux;
      F = Yaux - Y(:, i) - h*f(t(i+1), Yaux);
      Jf = eye(m) - h*df(t(i+1), Yaux);
      d = -Jf\F;
      Yaux += d;
    endwhile
    Y(:, i+1) = Yaux;
  endfor
endfunction

