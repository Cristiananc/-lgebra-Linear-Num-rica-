function [xn, t] = forward_Euler(x0, h, interval)
b = interval(2);
a = interval(1);
n = (b - a)/h;
t = zeros(1,n+1);
t(1) = a;
xn = zeros(2,n+1);
xn(:,1) = x0';
for i= 1:n
    xn(:,i + 1) = xn(:, i) + f(xn(:, i))*h;
    t(i+1) = a + i*h;
end

tiledlayout(2,1);

nexttile
%plot de x_1(t) aproximacao e solucao exata
exata1 = (9989/9999)*exp(-1000*t) + (10/9999)*exp(-0.1*t);
plot(t, xn(1,:), t, exata1);
legend('Euler Forward', 'Solução Exata');
title('x_1(t)')

% Bottom plot
nexttile

%plot de x_2(t)
exata2 = exp(-0.1*t);
plot(t, xn(2,:), t, exata2);
legend('Euler Forward', 'Solução Exata');
title('x_2(t)')

end

function dx = f(x)
A = [-1000 1; 0 -1/10];
dx = A*x;
end

