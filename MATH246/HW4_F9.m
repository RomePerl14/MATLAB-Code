%%%% Differential Equations Homework 4 - Romeo Perlstein %%%%

close all
close all force
%% Problem F9

%%% a)
syms x y % set up some global sim variables
eq1 = x * (1 - 0.5*x - 0.5*y); % this be equation 1 (yarr)
eq2 = y * (-0.25 + 0.5*x); % this is equation 2
[xc,yc] = solve(eq1, eq2, [x,y]), % solve for da equation symbolically

critpoints = [xc yc] % these are the critical points

JacobianMatrix = jacobian([eq1 eq2], [x y]) % so excited to be using Jacobians!
eigens = eig(JacobianMatrix);
eigens_solved1 = subs(eigens, {x,y}, {0,0}) % plugging in crit points to eigen val eq
eigens_solved2 = subs(eigens, {x,y}, {2,0})
eigens_solved3 = subs(eigens, {x,y}, {1/2, 3/2})

disp("eigen values for [0,0] crit point") % displaying for the graders liesure (Hey Revati?)
disp(eigens_solved1)
disp("eigen values for [2,0] crit point")
disp(eigens_solved2)
disp("eigen values for [1/2,3/2] crit point")
disp(eigens_solved3)

% for [0,0], since the eigenvalues are opposite in sign, the critical point
% is a saddle
% for [2,0], since again since the eigenvalues are opposite in sign, the
% critical point is a saddle
% for [1/2, 3/2], since the critcal point is a complex number, that has the
% form a +/- bi, and since a is less than 0 in both cases, the critical
% point is a stable spiral

%%% b)
[X, Y] = meshgrid(-2:1/4:3, -2:1/4:3); % makin da graph
U = X.*(1 - 0.5*X - 0.5*Y);
V = Y.*(-0.25 + 0.5*X);
L = sqrt((U/3).^2 + (V/3).^2);
vectorField = quiver(X, Y, U./L, V./L, .5, "*bl") % blue vector field
axis equal tight % tite B)



figure
vectorField_with_points = quiver(X, Y, U./L, V./L, .5, "b") % plot again but this time with labeled points
hold on
plot(xc(1), yc(1), "or")
plot(xc(2), yc(2), "or")
plot(xc(3), yc(3), "or")
axis equal tight

%%% c)
f = @(t,x) [x(1)*(1-.5*x(1)-.5*x(2)); x(2)*(-.25 + .5*x(1))]; % no find the phase portrait (curtosey of the textbook)
warning off MATLAB:ode45:IntegrationTolNotMet
for a = [1 5]
    for b = 0.1:0.015:1
        [t, xa] = ode45(f, [0,50], [a*b a*4*(.5-b)]);
        plot(xa(:,1), xa(:,2))
        [t, xa] = ode45(f, [0 -10], [a*b a*4*(.5-b)]);
        plot(xa(:,1), xa(:,2))
    end
end
axis([-2 3 -2 3])
% flow of the field above 0 seems to be going toward the critical point,
% spiraling inwards, from right to left!
% as well from below x=0, and y>0, the graph starts to trend toward the
% bottom left corner, for seemingly infinity
% it reminds me a lot of hair, or pasta!

%%% d)
% My interpretation of the phase portrait is the following: as as predator
% population (y) approaches 0 in the first quadrant, the prey population
% begins to increase, and vice versa for their respective axis, however if
% the prey population is equal to 0, the predator population begins to
% decrease. Invertedly, if the predator population decrease, the prey
% population increases. However, if the predator population is equal to 0,
% the prey population does not increase exponentially, and starts to
% decrease after the prey population begins to grow (I'm guessing do to
% lack of resources. Also, the prey population will decrease as long as the
% predators are greater than 0, and it's a more rapid increase if there are
% more prey, but proportionally the decrease of large amounts of prey is
% proportional. What seems to happen, is that the population sizes, no
% matter the start point (as long as it's in the first quadrant), will
% always approach an equilibrium point after a certain time. where the
% rate of change of predator size is "constant" with the rate of change of
% the prey size.
% Conceptually, this all makes sense: if the predator size is large, but
% the prey size is small, then the predator population will decrease, and
% if the prey size can only be so large before competition of resources
% causes them to also decrease. And then of course, there would be an
% equilibrium point where the change in predator size is constsistant and
% the change in prey size is consistant as well. This is what I was able to
% take away from the phase portrait

%%% e)
figure
[t, xb] = ode45(f, [0:.1:5], [1,1]) % begin solving for the initial given value

[X1, Y1] = meshgrid(0:1/4:3, 0:1/4:3); % (be lazy) remake the og graph so you can "hold" 
U = X1.*(1 - 0.5*X1 - 0.5*Y1);
V = Y1.*(-0.25 + 0.5*X1);
L = sqrt((U/3).^2 + (V/3).^2);
quiver(X1, Y1, U./L, V./L, .5, "r")
axis tight
hold on
plot(xb(:,1), xb(:,2), "b")

[t, xc] = ode45(f, [0:1:5], [1,1]) % solve da equation again to soley extract 1 2 3 4 5
table_of_vals = [t(1) xc(1,1) xc(1,2) ; t(2) xc(2,1) xc(2,2); t(3) xc(3,1) xc(3,2); t(4) xc(4,1) xc(4,2); t(5) xc(5,1) xc(5,2); t(6) xc(6,1) xc(6,2)] % do a little extractoin


%%% f)
% making the roughest estimation known to man, and using the table creating
% from solving the IVP, I think it would take roughly 3-4 timesteps before
% each population is within .1 of their equilibrium points. This, again is
% a rough estimate going off of the table date.


% hey revati! I hope things are well. Sorry for not being in discussion,
% like, at all. I've been putting this class on the back burner more then I
% shuold have, but wish me luck! -Romeo


