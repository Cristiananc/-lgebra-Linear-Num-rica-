function [X,count] = SeidelAdaptado(n,e)
tic
A = fliplr(speye(n,n)*0.5);
A = spdiags(bsxfun(@times,ones(n,1),[-1 3 -1]),[1, 0, -1], A);

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
    X(1) = (1/3)*(b(1) + X(2) - 0.5*X(n));
    for i = 2:n-1
        if (i == (n/2)) || (i == (n/2) + 1)
             X(i) = (1/3)*(b(i) + X(i -1) + X(i + 1));
        else
        X(i) = (1/3)*(b(i) + X(i -1) + X(i + 1) - 0.5*X(n+ 1 -i));
        end
    end
    X(n) = (1/3)*(b(n) + X(n -1) - 0.5*X(1));
    diff = norm(X - x, inf);
    count = count + 1;
end
disp(diff);
toc
end
