function retval = serie2 (f, epsilon)
  partsum = 0;
  n = 0;
  while (f(n) >= epsilon)
    partsum += f(n++);
  endwhile
  partsum += f(n);
  retval = partsum;
endfunction
