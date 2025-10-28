v = zeros(1, 20);
fibo = fibonacci(20);

for i = 2:21
  v(i-1) = fibo(i) / fibo(i-1);
endfor

numaureo = (1 + sqrt(5)) / 2;
disp(['Numero Aureo: ', num2str(numaureo)]);
disp(['f1/f0..f20/f19: ', mat2str(v)]);
