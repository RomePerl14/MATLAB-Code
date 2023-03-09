%%%% Differential Equations Homework 3 - Romeo Perlstein %%%%

%%%% -- Problem D3 --- %%%%

%%%% a)

% Given general solution:
% Theta = @(t) A*cos(t-delta);
% Theta" + sin(theta) = 0
% Theta" = -sin(theta)

%finding numerical solution of given equation D.3
theta_2_prime  = @(t, theta) [theta(2); -sin(theta(1))];

theta_zero = [.1 .7 1.5 3];
theta_p_zero = 0;

%%% Didn't work, but had a rather interesting result
% for i = 1:1:length(theta_zero)
%     [tA, thetaA] = ode45(theta_2_prime, [-10 10], [theta_zero(i), theta_p_zero]);
% end

[tA1, thetaA1] = ode45(theta_2_prime, [-10 10], [theta_zero(1) theta_p_zero]);
[tA2, thetaA2] = ode45(theta_2_prime, [-10 10], [theta_zero(2) theta_p_zero]);
[tA3, thetaA3] = ode45(theta_2_prime, [-10 10], [theta_zero(3) theta_p_zero]);
[tA4, thetaA4] = ode45(theta_2_prime, [-10 10], [theta_zero(4) theta_p_zero]);
figure
plot(tA1, thetaA1);
title("graph 1");
figure
plot(tA2, thetaA2);
title("graph 2");
figure
plot(tA3, thetaA3);
title("graph 3");
figure
plot(tA4, thetaA4);
title("graph 4");
figure

hold on
plot(tA1, thetaA1, "r");
plot(tA2, thetaA2, "b");
plot(tA3, thetaA3, "g");
plot(tA4, thetaA4, "m");
title("graph 1-4 overlay")

%%%% estimated periods:
% first amplitude T = ~6.2, or ~2pi
% second amplitude T = ~6.6 or ~2.1pi
% third amplitude T = ~ 7.5 or (12/5)pi
% fourth amplitude T = ~8 or (5/2)pi
%%%% Show it by using the values in the graph

   