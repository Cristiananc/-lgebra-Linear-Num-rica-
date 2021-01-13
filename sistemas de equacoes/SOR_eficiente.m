function X = SOR_eficiente(A, x, w, tol)
% Dado o vetor solução x, encontro o vetor b
b = A*x;
% Chute inicial para X (X é a aproximação que quero encontrar)
X = ones(size(b));
m2 = size(b, 1);
m = sqrt(m2);
% Diferença para o critério de comparação
diff = tol + 1;
%Variável para contar o número de iterações
count = 0;
tic;
while (diff > tol)
    disp(X);
    X(1) = (1 - w)*X(1) + (w/4)*(b(1) + X(2) + X(m));
    for i = 2:m
        X(i) = (1 - w)*X(1) + (w/4)*(b(i) + X(i-1) +X(i+1) + X(m+i));
    end
    for i= m+1:(m2 -m)
        X(i) = (1 - w)*X(i) + (w/4)*(b(i) + X(i- m) + X(i-1) +X(i+1) + X(m+i));
    end
    for i= m2 -m + 1: m2 -1
        X(i) = (1 - w)*X(i) + (w/4)*(b(i) + X(i- m) + X(i-1) +X(i+1));
    end
    X(m2) = (1 - w)*X(m2) + (w/4)*(b(m2) + X(m2- m) + X(m2-1));
    diff = norm(X - x, inf);
    count = count + 1;
end
toc;
disp(count);
end
