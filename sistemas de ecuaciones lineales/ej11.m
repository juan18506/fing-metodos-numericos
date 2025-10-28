clear
clc

ns = [5, 10];

for n = ns
  A = hilb(n);
  xn = ones(n,1);
  bn = A * xn;

  xn_techo = A \ bn;

  % calculo residuo y error absoluto
  en = xn - xn_techo;
  rn = bn - (A * xn_techo);

  % veamos normas 1, 2 e inf
  disp(['Norma 1 - error abs: ', num2str(norm(en, 1), '%.3e'),
                  ' residuo: ', num2str(norm(rn, 1), '%.3e')
                  ' cond: ', num2str(cond(A), '%.3e'),
                  ' vs norm: ', num2str(norm(A,1)*norm(invhilb(n), 1), '%.3e')
  ]);
  disp(['Norma 2 - error abs: ', num2str(norm(en, 2), '%.3e'),
                  ' residuo: ', num2str(norm(rn, 2), '%.3e')
                  ' cond: ', num2str(cond(A), '%.3e'),
                  ' vs norm: ', num2str(norm(A, 2)*norm(invhilb(n), 2), '%.3e')
  ]);
  disp(['Norma inf - error abs: ', num2str(norm(en, inf), '%.3e'),
                   ' residuo: ', num2str(norm(rn, inf), '%.3e')
                   ' cond: ', num2str(cond(A), '%.3e'),
                   ' vs norm: ', num2str(norm(A, inf)*norm(invhilb(n), inf), '%.3e')
  ]);
  disp('');
endfor
