function retval = fibonacci (n)
  retval = zeros(1, n+1);
  retval(1) = 1;
  if (n >= 1)
    retval(2) = 1;
  endif
  for i = 2:n
    retval(i+1) = retval(i) + retval(i-1);
  end
endfunction

