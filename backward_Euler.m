function [xn, t] = backward_Euler(x0, h, interval)
b = interval(2);
a = interval(1);
n = (b - a)/h;
t = zeros(1,n+1);
t(1) = a;
xn = zeros(2,n+1);
xn(:,1) = x0';
A = [-1000 1; 0 -1/10];

for i= 1:n
    %no metodo implicito ficamos com x_k+1 sendo a solucao do sistema 
    %linear (I - hA)*x_k+1 = x_
    xn(:,i + 1) = linsolve((eye(2) - h*A), xn(:, i));
    t(i+1) = a + i*h;
end
tiledlayout(2,1);

nexttile
%plot de x_1(t) aproximacao e solucao exata
exata1 = (9989/9999)*exp(-1000*t) + (10/9999)*exp(-0.1*t);
plot(t, xn(1,:), t, exata1);
legend('Euler Backward', 'Solução Exata');
title('x_1(t)')

% Bottom plot
nexttile

%plot de x_2(t)
exata2 = exp(-0.1*t);
plot(t, xn(2,:), t, exata2);
legend('Euler Backward', 'Solução Exata');
title('x_2(t)')

end


