%%%% Differential Equations Homework 4 - Romeo Perlstein %%%%

%%%% Useful notation:
%%%% heaviside function u(t), u_c(t-c)

%% Question E14

%%% a)
% y'' + 4y = (1 - u(t-2pi))sin(t),    y(0) = 0,   y'(0)=0
syms t s y(t) Y
og_eq_A = diff(y, 2) + 4*y == (1-heaviside(t-(2*pi)))*sin(t) % The OG equation
laplace_eq_A = laplace(equation_a, t, s) % The equation, not transformed using the Laplace transformation

better_laplace_eq_A = subs(og_eq_A, [y(0), subs(diff(y(t), t), t, 0), laplace(y(t), t, s)], [0, 0, Y]) 
% uhhh not going to lie this is just what the textbook suggested. It 
% apparently makes it easier to solve for y? my understanding is that, 
% since eq1 had a bunch of subs values in it, this new format allows for 
% us to simply do all that subbing in one line.

solve_laplace_eq_A = simplify(solve(better_laplace_eq_A, Y)) % solve for da equation
og_vspace_eq_A = ilaplace(solve_laplace_eq_A) % back to the original vector space and solve for it

%%%% Time to do this several more times!

%%% b)
% y" + 6y' + 8y = h(t)
syms h(t)
h = piecewise(0<=t<5,0, 5<=t<10,1, t>=10,-1) % create the piecewise expression
og_eq_B = diff(y, 2) + 6*diff(y, 1) + 8*y == h % the OG equation
laplace_eq_B = laplace(og_eq_B, t, s) % Laplace transform of eq B

% even though I believe the previous step was unecessary, I will be leaving
% it in
better_laplace_eq_B = subs(og_eq_B, [y(0), subs(diff(y(t), t), t, 0), laplace(y(t), t, s)], [0, 2, Y])
solve_laplace_eq_B = simplify(solve(better_laplace_eq_A, Y))
og_vspace_eq_B = ilaplace(solve_laplace_eq_B)

fplot(og_vspace_eq_B, [0,15])



% fplot(og_vspace_eq_A, [0, 15])




