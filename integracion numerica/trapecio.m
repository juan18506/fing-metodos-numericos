function q = trapecio (f, a, b, N)
  h = (b-a)/N;
  nodos = a + h*(1:N-1);
  q = h*(1/2 * f(a) + sum(f(nodos)) + 1/2 * f(b));
endfunction
