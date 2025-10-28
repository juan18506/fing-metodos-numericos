function retval = collatz (m)
  retval = [m];
  paso = 1;
  do
    if (mod(retval(end), 2) == 0)
      retval(end+1) = retval(end)/2;
    else
      retval(end+1) = 3*retval(end) + 1;
    endif
  until (paso++ == 500 || retval(end) == 1)
endfunction
