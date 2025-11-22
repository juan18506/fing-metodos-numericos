function [q, count] = cuadratura_adaptativa (f, a, b, tol)
  count = 2; % cantidad de subintervalos
  fa = f(a);
  fb = f(b);
  QT = (b-a)/2*(fa+fb); % trapecio

  c = (a+b)/2;
  fc = f(c);
  QS = (b-a)/6*(fa+4*fc+fb); % simpson

  if abs(QT-QS) <= tol
    q = QT; % se acepta el valor dado por regla del trapecio
  else % se usa el alg. en subintervalos [a, c] y [c, b]
    [q_izq, count_izq] = cuadratura_adaptativa(f, a, c, 0.5*tol);
    [q_der, count_der] = cuadratura_adaptativa(f, c, b, 0.5*tol);
    q = q_izq + q_der;
    count = count_izq + count_der;
  endif
endfunction
