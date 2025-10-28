n = 100;
A = randn(n);             % matriz aleatoria 100x100
B = randn(n,10);          % 10 vectores b como columnas

% ---- Método 1: con bslashtx cada vez ----
tic
X1 = zeros(n,10);
for j = 1:10
    X1(:,j) = bslashtx(A, B(:,j));
end
t1 = toc;

% ---- Método 2: factorización una vez + forward/back ----
tic
[L,U,p] = lutx(A);
X2 = zeros(n,10);
for j = 1:10
    y = forward(L, B(p,j));   % resolver L y = P*b
    x = backsubs(U, y);       % resolver U x = y
    X2(:,j) = x;
end
t2 = toc;

% ---- Verificación ----
disp('Error entre soluciones:')
disp(norm(X1 - X2))

disp(['Tiempo metodo 1 (bslashtx 10 veces): ', num2str(t1), ' seg']);
disp(['Tiempo metodo 2 (lutx 1 vez + sustituciones): ', num2str(t2), ' seg']);

