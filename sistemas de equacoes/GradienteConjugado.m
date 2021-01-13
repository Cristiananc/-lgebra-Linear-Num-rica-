function [X,i, err] = Gradienteconjugado(n, k)
tic
A = fliplr(speye(n,n)*0.5);
A = spdiags(bsxfun(@times,ones(n,1),[-1 3 -1]),[1, 0, -1], A);

% Dado o vetor solução x, encontro o vetor b
x = ones(n,1);
b = A*x;

% Chute inicial para X (X é a aproximação que quero encontrar)
X = zeros(n,1);

%r e d iniciais
rk = b - A*X;
dk = rk;

for i = 0: k-1
    if rk == 0
        break;
    end
    alphak = (dk'*rk)/(dk'*A*dk);
    X = X + alphak*dk;
    rk = rk - alphak*A*dk;
    dk = rk - ((rk'*A*dk)/(dk'*A*dk))*dk;
   
    err = norm(X - x, inf);
end
toc
end


