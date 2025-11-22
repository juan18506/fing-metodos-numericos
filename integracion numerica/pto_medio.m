function q = pto_medio (f, a, b, N)
  h = (b-a)/N;
  nodos = a + h*(0.5:1:N);
  q = h * sum(f(nodos));
endfunction
