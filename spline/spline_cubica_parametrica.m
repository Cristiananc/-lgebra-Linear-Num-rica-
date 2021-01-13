function spline_cubica_parametrica(x, y)
n = length(x) - 2;

%Coordenadas dos pontos guia
x1hat = x(2);
xnhat = x(n + 2);

y1hat = y(2);
ynhat = y(n + 2);

%Excluo as coordenadas dos pontos guia para facilitar a implementação 
x(2) = x(1);
y(2) = y(1);
x = x(2:n+1);
y = y(2:n+1);

%Constantes da spline I
d_x = x(1);
d_y = y(1);

c_x = (x1hat - x(1));
c_y = (y1hat - y(1));

if n > 2
b_x = 1;
b_y = 1;

a_x = x(2) - b_x - c_x - d_x;
a_y = y(2) - b_y - c_y - d_y;

t= linspace (0,1);

X = a_x*t.^3 + b_x*t.^2 + c_x*t + d_x;
Y = a_y*t.^3 + b_y*t.^2 + c_y*t + d_y;
plot(X,Y);

%As splines que conectam os pontos no "meio"
for i=2:n-2
    d_x = x(i);
    d_y = y(i);
    
    c_x = 3*a_x + 2*b_x + c_x;
    c_y = 3*a_y + 2*b_y + c_y;
    
    b_x = 1;
    b_y = 1;

    a_x = x(i+1) - b_x - c_x - d_x;
    a_y = y(i+1) - b_y - c_y - d_y;
    
    X = a_x*t.^3 + b_x*t.^2 + c_x*t + d_x;
    Y = a_y*t.^3 + b_y*t.^2 + c_y*t + d_y;
    plot(X,Y);
end

%Por fim, fazemos a spline ligando os dois últimos pontos
d_x = x(n-1);
d_y = y(n-1);

c_x = 3*a_x + 2*b_x + c_x;
c_y = 3*a_y + 2*b_y + c_y;

b_x = 4*x(n) - xnhat - 2*c_x - 3*d_x;
b_y = 4*y(n) - ynhat - 2*c_y - 3*d_y;

a_x = x(n) - b_x - c_x - d_x;
a_y = y(n) - b_y - c_y - d_y;

X = a_x*t.^3 + b_x*t.^2 + c_x*t + d_x;
Y = a_y*t.^3 + b_y*t.^2 + c_y*t + d_y;
plot(X,Y)

else 
b_x = 4*x(n) - xnhat - 2*c_x - 3*d_x;
b_y = 4*y(n) - ynhat - 2*c_y - 3*d_y;

a_x = x(n) - b_x - c_x - d_x;
a_y = y(n) - b_y - c_y - d_y;

t= linspace (0,1);

X = a_x*t.^3 + b_x*t.^2 + c_x*t + d_x;
Y = a_y*t.^3 + b_y*t.^2 + c_y*t + d_y;
plot(X,Y);

end
end

