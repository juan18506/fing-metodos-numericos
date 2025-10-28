function retval = intercambio (A, n, m)
  v = A(n, :);
  A(n, :) = A(m, :);
  A(m, :) = v;
  retval = A;
endfunction
