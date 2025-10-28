function x = secante (f, x0, x1)
  iter = 1;
  maxIter = 100;
  tol = 1e-5;
  while abs(x0-x1) > tol && iter < maxIter
    sk = (f(x1) - f(x0)) / (x1 - x0);
    x0 = x1;
    x1 = x1 - (f(x1) / sk);
    iter += 1;
  endwhile
  x = x1;
endfunction
