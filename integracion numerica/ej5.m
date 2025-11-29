clear
clc

f1 = @(x1,w1,x2,w2) w1+w2;
f2 = @(x1,w1,x2,w2) w1*x1+w2*x2;
f3 = @(x1,w1,x2,w2) w1*x1^2+w2*x2^2;
f4 = @(x1,w1,x2,w2) w1*x1^3+w2*x2^3;

N = 1e6;
vec = [
  trapecio(@(x) e.^x, -1, 1, N);
  trapecio(@(x) x.*e.^x, -1, 1, N);
  trapecio(@(x) x.^2.*e.^x, -1, 1, N);
  trapecio(@(x) x.^3.*e.^x, -1, 1, N)
];

f = @(x) [
  f1(x(1),x(2),x(3),x(4));
  f2(x(1),x(2),x(3),x(4));
  f3(x(1),x(2),x(3),x(4));
  f4(x(1),x(2),x(3),x(4))
] - vec;

% Jacobiana f
Df = @(x1,w1,x2,w2) [
  0, 1, 0, 1;
  w1, x1, w2, x2;
  2*x1*w1, x1^2, 2*x2*w2, x2^2;
  3*x1^2*w1, x1^3, 3*x2^2*w2, x2^3
];

x = [
  0;
  0.5;
  0.5;
  1
];

todos_x = x;
iter = 0;
anterior = [inf; inf; inf; inf];

while norm(x-anterior) > 1e-12 && iter < 20
  iter += 1;
  anterior = x;
  b = f(x);
  A = Df(x(1),x(2),x(3),x(4));
  d = -A\b;
  x += d;
  todos_x = [todos_x x];
endwhile

printf("x1: %d, w1: %d, x2: %d, w2: %d\n", x(1),x(2),x(3),x(4));

