function [xn, t] = Runge_Kutta4(h, interval, k, alpha, beta)
b = interval(2);
a = interval(1);
n = round((b - a)/h);
t = zeros(n+1,1);
t(1) = a;
xn = zeros(n+1,1);
for i= 1:n
    k1 = h*f(xn(i));
    k2 = h*f(xn(i) + k1/2);
    k3 = h*f(xn(i) + k2/2);
    k4 = h*f(xn(i) + k3);
    xn(i+1) = xn(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t(i+1) = a + i*h;
end

function dx = f(x1)
    dx = k*(alpha - x1)*(beta - x1);
end
%exata = 350*(1 - exp(-0.2*t))/(7 - 5.*exp(-0.2*t));

plot(t,xn);
%plot(t,xn, t, exata(:, n+1));
%legend('Ruge-Kutta 4', 'Solução Exata');
ylim([0 60]);
xlim([-2 b]);
end


