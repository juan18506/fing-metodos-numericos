clear
clc

p = ones(20,1);
p(1)=1;
for n = 2:30
  p(n) = exp(1)-n*p(n-1);
end

p_real = ones(20,1);
for n = 1:30
  f = @(x) x^n*exp(x);
  p_real(n) = quad(f,0,1);
end

