clear
clc

Ns = [1e3, 1e4, 1e5, 1e6];
printf("solucion pi/4 = %d\n", pi/4);
for N = Ns
  q = montecarlo(N);
  printf("Para N=%.1e, q=%d\n", N, q);
endfor

