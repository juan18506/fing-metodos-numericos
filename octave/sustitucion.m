function retval = sustitucion (A, v, n)
  A(n, :) = v;
  retval = A;
endfunction
