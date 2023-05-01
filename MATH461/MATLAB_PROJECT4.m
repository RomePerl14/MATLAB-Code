%%%% MATLAB PROJECT 4, MATH461, LINEAR ALGEBRA FOR SCIENTIST AND ENGINEERS
%%%% Romeo Perlstein, 5/1/2023
%%%% UID: 118030685, section 0123


%% Question 1
%%% a)
format rat
syms t
Epsilon1_1 = {1, t, t^2, t^3}
B1_1 = {1, 1+2*t, 2-t+3*(t^2), 4-t+t^3}
C1_1 = {1+3*t+t^3, 2+t, 3*t-t^2+4*t^3, 3*t}

P1_1 =