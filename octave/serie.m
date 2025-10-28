function retval = serie (f, N)
  partsum = 0;
  for i = 0:N
    partsum += f(i);
  endfor
  retval = partsum;
endfunction
