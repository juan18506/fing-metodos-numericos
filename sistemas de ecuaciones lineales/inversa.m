function retval = inversa (A)
  [L,U,p] = lutx(A);
  [n,n] = size(A);
  retval = zeros(n);

  for i = 1:n
    id = zeros(n,1);
    id(i) = 1;
    y = forward(L, id(p));
    x = backsubs(U, y);
    retval(:,i) = x;
  endfor
endfunction
