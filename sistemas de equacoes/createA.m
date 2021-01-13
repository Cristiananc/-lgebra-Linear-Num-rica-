function A = createA(m)
tic;
diag2 = ones(m, 1);
Bt = [-diag2, 4*diag2, - diag2];
T = spdiags(Bt, [-1,0,1], m,m);
%Com o codígo abaixo o matlab converte a matriz que antes estava inteira
%pra esparsa
%T = sparse(eye(m,m)*4 + diag(diag2, -1) + diag(diag2, 1));

%Cria a matriz a esparsa com os blocos T na diagonal
%https://www.mathworks.com/help/matlab/ref/kron.html#bt0autl-2_1
A = kron(speye(m,m), T);

%Adiciona os valores dos blocos que estão na diagonal acima e abaixo da 
%diagonal principal
A = spdiags(bsxfun(@times,ones(m^2,1),[-1 -1]),[-m, m], A);
toc;
end
