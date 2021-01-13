function [X,count] = Jacobi(n,e)
tic
A = fliplr(speye(n,n)*0.5);
A = spdiags(bsxfun(@times,ones(n,1),[-1 3 -1]),[1, 0, -1], A);
L = tril(A,-1);
U = triu(A,1);
C = L+ U;

% Dado o vetor solução x, encontro o vetor b
x = ones(n,1);
b = A*x;
% Chute inicial para X (X é a aproximação que quero encontrar)
X = zeros(n,1);

% Diferença para o critério de comparação
diff = e + 1;
%Variável para contar o número de iterações
count = 0;

while (diff > e)
    Xprev = X;
    X = (1/3)*(b - C*Xprev);
    diff = norm(X - x, inf);
    count = count + 1;
end
toc
end
