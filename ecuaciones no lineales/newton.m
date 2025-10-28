function x = newton (f, fx, x0)
  iter = 0;
  maxIter = 100;
  tol = 1e-5;
  while abs(f(x0)) > tol && iter < maxIter
    x0 = x0 - (f(x0) / fx(x0));
    iter += 1;
  endwhile
  x = x0;
endfunction
