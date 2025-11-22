function q = simpson (f, a, b, N)
  h = (b-a)/N;
  q = 0;
  for j = 1:N
    q = q + h/6 * (f(a+(j-1)*h) + 4*f(a+(j-1)*h+h/2) + f(a+j*h));
  endfor
endfunction
