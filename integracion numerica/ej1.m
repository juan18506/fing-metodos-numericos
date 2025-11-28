clear
clc

f = @(x) 2./(1+x.^2);
for N = 1:25
  q = trapecio(f, -1, 1, N);
  err = q - pi;
  printf('Para N=%d, Qt(f) = %d, err = %.3e\n', N, q, err);
endfor
