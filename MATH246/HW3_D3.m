%%%% Differential Equations Homework 3 - Romeo Perlstein %%%%

%%%% -- Problem D3 --- %%%%

close all
close all force
%% a)

% Given general solution:
% Theta = @(t) A*cos(t-delta);
% Theta" + sin(theta) = 0
% Theta" = -sin(theta)

%finding numerical solution of given equation D.3
theta_2_prime  = @(t, theta) [theta(2); -sin(theta(1))];

theta_zero = [.1 .7 1.5 3];
theta_p_zero = 0;

%%%& Didn't work, but had a rather interesting result
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
% second amtplitude T = ~6.6 or ~2.1pi
% third amplitude T = ~ 7.5 or (12/5)pi
% fourth amplitude T = ~8 or (5/2)pi


%%%% analyze the graph x an y values, see when the y values repeat, and see
%%%% the delta x when it does:
period_look_1 = [tA1(:,1) thetaA1(:,1)]
period_look_2 = [tA2(:,1) thetaA2(:,1)]
period_look_3 = [tA3(:,1) thetaA3(:,1)]
period_look_4 = [tA4(:,1) thetaA4(:,1)]

%%%% Looks good on the interval [1:50] for the first 3 graphs, 1:100 for the
%%%% 4th graph, so display the interval:

period_look_1_but_better = [tA1(1:50,1) thetaA1(1:50,1)]
period_look_2_but_better = [tA2(1:50,1) thetaA2(1:50,1)]
period_look_3_but_better = [tA3(1:50,1) thetaA3(1:50,1)]
period_look_4_but_better = [tA4(1:100,1) thetaA4(1:100,1)]

period_guesstamate1 = string((tA1(50) - tA1(1))/pi) + "pi"
period_guesstamate2 = string((tA2(50) - tA1(1))/pi) + "pi"
period_guesstamate3 = string((tA3(50) - tA1(1))/pi) + "pi"
period_guesstamate4 = string((tA4(100) - tA1(1))/pi) + "pi"


%% b)
A1 = 0.1;
A2 = 0.7;
A3 = 1.5;
A4 = 3.0;
k1 = sin(A1/2);
k2 = sin(A2/2);
k3 = sin(A3/2);
k4 = sin(A4/2);
func1 = @(phi) 4./(sqrt(1-(k1.^2).*(sin(phi)).^2));
func2 = @(phi) 4./(sqrt(1-(k2.^2).*(sin(phi)).^2));
func3 = @(phi) 4./(sqrt(1-(k3.^2).*(sin(phi)).^2));
func4 = @(phi) 4./(sqrt(1-(k4.^2).*(sin(phi)).^2));

T1 = integral(func1, 0, (pi()/2));  
T2 = integral(func2, 0, (pi()/2));
T3 = integral(func3, 0, (pi()/2));
T4 = integral(func4, 0, (pi()/2));
T_actual = [string(T1/pi())+"pi" string(T2/pi())+"pi" string(T3/pi())+"pi" string(T4/pi())+"pi"]

% yes! the values I had found for my periods are rather close to what
% the integral function using the actual time peiod function outputted.
% This may be because I tried to make my values as accurate as possible,
% however.

%% c)

%%%% Show it by using the values in the graph, and better parameters

for i = 2:1:50
    if (thetaA1(i,1) <= thetaA1(1,1)+.005 && thetaA1(i,1) >= thetaA1(1,1) - .005)
        temp_period1 = tA1(i) - tA1(1);
        period1 = string(temp_period1/pi()) + "pi";
    end
end

for i = 2:1:53
    if (thetaA2(i,1) <= thetaA2(1,1)+.001 && thetaA2(i,1) >= thetaA2(1,1) - .001)
        temp_period2 = tA2(i) - tA2(1);
        period2 = string(temp_period2/pi()) + "pi";
    end
end

for i = 2:1:54
    if (thetaA3(i,1) <= thetaA3(1,1) + .05 && thetaA3(i,1) >= thetaA3(1,1) - .05)
        temp_period3 = tA3(i) - tA3(1);
        period3 = string(temp_period3/pi()) + "pi";
    end
end

for i = 2:1:110
    if (thetaA4(i,1) >= thetaA4(1,1) && thetaA4(i,1) >= thetaA4(i-1,1))
        temp_period4 = tA4(i) - tA4(1);
        period4 = string(temp_period4/pi()) + "pi";
    end
end

%%%% display the solved for values of the time period, using the plots
period1
period2
period3
period4


%% d)
%%%% Providing an answer through a written response
% amazingly, the prediction made by the book was correct, and while A is
% relatively small, (seemingly 0-1.5), the period of the function remains
% roughly around 2pi. As A increases though, the period starts to also
% increase, and it seems to reach a point where the described movement of
% the pendulum becomes "weird" or at least incorrect. This is also
% corroberated in the output of the graph, where you can see that for a
% larger amplitude of 3, the graph is no longer a sinusoidal wave, but has
% two different graphs, which are not just simple phase shifts of the same
% graph. 

% the period seems to increase as the amplitude increases, which is also
% demonstrated with the output of the graphs. If I were to guess, because
% I'm not exactly sure what's happening, I would assume the linear
% approximnation of the differential equation starts to "explode" as the
% amplitude get's bigger. If I'm thinking about it correctly, it kind of
% does make senes, since if the displacement of the pendulum becomes larger
% and larger, the behavior of the pendulum wont follow simply harmonic
% motion anymore (I think). As such, the approximation becomes less and
% less accurate, because it wasn't meant to model the behavior of an
% erratic pendulum.

% This is speculation on my end, after reviewing the behavior, however.



