function retval = esPar (n)
  v = [1, 0];
  r = mod(n, 2);
  retval = v(r+1);
endfunction
