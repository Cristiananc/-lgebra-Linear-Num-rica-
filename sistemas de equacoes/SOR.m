function X = SOR(A, x, w, tol)
%x = ones(m^2,1)*2;
% Dado o vetor solução x, encontro o vetor b
b = A*x;
% Chute inicial para X (X é a aproximação que quero encontrar)
X = ones(size(b));
m2 = size(b, 1);
% Diferença para o critério de comparação
diff = tol + 1;
%Variável para contar o número de iterações
count = 0;
tic;
while (diff > tol)
    Xprev = X;
    for i = 1:m2
        X(i,1) = (1 - w)*Xprev(i,1) + (w/A(i,i))*(b(i, 1) - A(i, 1: i - 1)*X(1:i-1,1) - A(i,i+1:m2)*Xprev(i+1:m2,1));
    end
    diff = norm(X - x, inf);
    count = count + 1;
end
tempo = toc;
disp(count);
disp(tempo);
end
