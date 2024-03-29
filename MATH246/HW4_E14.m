%%%% Differential Equations Homework 4 - Romeo Perlstein %%%%

%%%% Useful notation:
%%%% heaviside function u(t), u_c(t-c)
close all
close all force
%% Question E14

%%% a)
% y'' + 4y = (1 - u(t-2pi))sin(t),    y(0) = 0,   y'(0)=0
syms sA yA(tA) YA
og_eq_A = diff(yA, 2) + 4*yA == (1-heaviside(tA-(2*pi)))*sin(tA) % The OG equation
laplace_eq_A = laplace(og_eq_A, tA, sA) % The equation, transformed using the Laplace transformation

better_laplace_eq_A = subs(laplace_eq_A, [yA(0), subs(diff(yA(tA), tA), tA, 0), laplace(yA(tA), tA, sA)], [0, 0, YA]) 
% uhhh not going to lie this is just what the textbook suggested. It 
% apparently makes it easier to solve for y? my understanding is that, 
% since eq1 had a bunch of subs values in it, this new format allows for 
% us to simply do all that subbing in one line.

solved_laplace_eq_A = simplify(solve(better_laplace_eq_A, YA)) % solve for da equation
og_vspace_eq_A = ilaplace(solved_laplace_eq_A) % back to the original vector space and solve for it

%%%% Time to do this several more times!

%%% b)
% y" + 6y' + 8y = h(t)
syms hB yB(tB) YB sB
hB = heaviside(tB-5) + heaviside(tB-10)*(1-0) + heaviside(tB-10)*(-1-2) % the piecewise equation
og_eq_B = diff(yB, 2) + 6*diff(yB, 1) + 8*yB == hB % the OG equation
laplace_eq_B = laplace(og_eq_B, tB, sB) % Laplace transform of eq B

% even though I believe the previous step was unecessary, I will be leaving
% it in
better_laplace_eq_B = subs(laplace_eq_B, [laplace(yB(tB), tB, sB), yB(0), subs(diff(yB(tB), tB), tB, 0)], [YB, 0, 2]) % different from equation A!
solved_laplace_eq_B = (simplify(solve(better_laplace_eq_B, YB)))
og_vspace_eq_B = ilaplace(solved_laplace_eq_B)


%%% c)
% y" + 4y = dirac(t-3pi), y(0)=1, y'(0)=0
syms yC(tC) YC sC
og_eq_C = diff(yC, 2) + 4*yC == dirac(tC - (3*pi)) %the original equation C
laplace_eq_C = laplace(og_eq_C, tC, sC) % laplace transform of eq C

better_laplace_eq_C = subs(laplace_eq_C, [laplace(yC(tC), tC, sC), yC(0), subs(diff(yC(tC), tC), tC, 0)], [YC, 1, 0])
solved_laplace_eq_C = simplify(solve(better_laplace_eq_C, YC))
og_vspace_eq_C = ilaplace(solved_laplace_eq_C)

%%% d)
% y" + y = driac(t-2) - dirac(t-8)
syms yD(tD) YD sD
og_eq_D = diff(yD, 2) + yD == (dirac(tD - 2)) - (dirac(tD - 8))
laplace_eq_D = laplace(og_eq_D, tD, sD)

better_laplace_eq_D = subs(laplace_eq_D, [laplace(yD(tD), tD, sD), yD(0), subs(diff(yD(tD), tD), tD, 0)], [YD, 0, 0])
solved_laplace_eq_D = simplify(solve(better_laplace_eq_D, YD))
og_vspace_eq_D = ilaplace(solved_laplace_eq_D)


%% Plotting The Results
%%% Here, I plot the results from A, B, C, and D on different intervals to show the full form of the grap 
hold on
fplot(og_vspace_eq_A, [-15,15])
figure
fplot(og_vspace_eq_B, [0, 15])
figure
fplot(og_vspace_eq_C, [-15, 30])
figure
fplot(og_vspace_eq_D, [-15, 15])





