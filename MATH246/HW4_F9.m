%%%% Differential Equations Homework 4 - Romeo Perlstein %%%%

close all
close all force
%%%% -- Problem F9 ---- %%%%

%% a)

[X, Y] = meshgrid(-2:1/15:2, -2:1/15:2);
U = X * (1 - 0.5*X - 0.5*Y);
V = Y * (-0.25 + 0.5*X);
L = sqrt(U.^2 + V.^2);
quiver(X, Y, U./L, V./L, "-b")
axis equal tight


syms x y
[x, y] = solve([x*(1 - 0.5*x - 0.5*y), y*(-0.25 + 0.5*x)], [x,y]);

critpoints = [x(1) y(1) ; x(2) y(2) ; x(3) y(3)]

hold on
xline(0, "r")
yline(0, "r")
xline(2, "r")
yline(0, "r")
xline(1/2, "r")
yline(3/2, "r")

figure
quiver(X, Y, U./L, V./L, "ob")
axis equal tight


