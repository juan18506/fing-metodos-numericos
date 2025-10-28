function x = biseccion (f, a, b)
  iter = 1;
  maxIter = 100;
  tol = 1e-5;
  while b - a > tol && iter < maxIter
    m = (a + b) / 2;
    if abs(f(m)) < tol
      x = m;
      return;
    elseif f(m) * f(a) > 0
      a = m;
    else
      b = m;
    endif
    iter += 1;
  endwhile
  x = (a + b) / 2;
endfunction
