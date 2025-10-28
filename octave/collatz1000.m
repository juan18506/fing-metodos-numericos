max_pasos = 0;
semilla = 0;

for m = 1:999
  pasos = length(collatz(m));
  if pasos > max_pasos
    max_pasos = pasos;
    semilla = m;
  end
end

disp(['El valor de m con la secuencia más larga es: ', num2str(semilla)]);
disp(['Número de pasos: ', num2str(max_pasos)]);

