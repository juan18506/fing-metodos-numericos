clear
clc

p = ones(20,1);
p(20)=-100000000;
for n = 19:-1:1
  p(n) = (exp(1)-p(n+1))/(n+1);
end

p_real = ones(20,1);
for n = 1:20
  f = @(x) x^n*exp(x);
  p_real(n) = quad(f,0,1);
end
