clear
clc

xapr = 5
x = sqrt(25-4e-12)
% Error relativo de aproximar la raiz
erel = abs((xapr - x) / x)

r1apr = (-5-xapr)/2
r1 = (-5-x)/2
% Error relativo de r1
erel = abs((r1apr - r1) / r1)

r2apr = (-5+xapr)/2
r2 = (-5+x)/2
% Error relativo de r2
erel = abs((r2apr - r2) / r2)


r2apr = 1e-12/r1apr
r2 = 1e-12/r1
% Error relativo de r2 calculandolo por ruffini
% (x-r1)*(x-r2) = x² - (r1+r2)x + r1*r2
erel = abs((r2apr - r2) / r2)

