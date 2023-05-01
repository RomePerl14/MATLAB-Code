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

%%%% PB->E is [[b1]E [b2]E ...]
P1_1 = transpose([1 0 0 0; 1 2 0 0; 2 -1 3 0; 4 -1 0 1]) %%%% I tranpose here just to make it in the correct format, without having to completely rewrite it
Q1_1 = transpose([1 3 0 1; 2 1 0 0; 0 3 -1 4; 0 3 0 0])

%%% b)
R = inv(Q1_1)*P1_1

%%% c)
%%%% c1(1+3t+t^3) + c2(2+t) + c3(3t-t^2+4t^3) + c4(3t) = t^3
%%%% c1 + 3t(c1) + t^3(c1) + 2c2 + t(c2) + 3t(c3) - t^2(c3) + 4t^3(c3) + 3t(c4) = t^3
%%%% (c1+2c2) + (3tc1 + tc2 +3tc3 + 3tc4) + (-t^2(c3)) + (t^3c1 + 4t^3c3) = t^3
temp_trix_1 = [1 2 0 0 0; 3 1 3 3 0; 0 0 -1 0 0; 1 0 4 0 1]
temp_res_1 = rref(temp_trix_1)
C_coord_vect_1 = [temp_res_1(1,5) ; temp_res_1(2,5); temp_res_1(3,5); temp_res_1(4,5)]

%%%% sanity check
(C_coord_vect_1(1,1)*(1+3*t+t^3))+(C_coord_vect_1(2,1)*(2+t))+(C_coord_vect_1(3,1)*(3*t-t^2+4*t^3))+(C_coord_vect_1(4,1)*3*t)

%%% d)
pt_B_1 = transpose([0 1 2 3])
pt_C_1 = R*pt_B_1

%%% e)
%%%% convert p of b coords back to p coords. since we are given p_B,
%%%% multiply each element of p_B with B to get original polynomial
pt_1 = 0*1 + 1*(1 + 2*t) + 2*(2-t+3*t^2) + 3*(4-t+t^3)

%% Question 2
format short
A_2 = [0 1 2; 3 4 5; 6 7 8]

%%% a)
eig(A_2)

%%% b)
B_2 = [A_2(2,:); A_2(1,:); A_2(3,:)]
C_2 = [7*A_2(1,:); A_2(2,:); A_2(3,:)]
D_2 = [A_2(1,:); A_2(2,:); A_2(3,:) + 3*A_2(1,:)]

%%%% re-adding eig(A) for comparison)
eig(A_2)
eig(B_2)
eig(C_2)
eig(D_2)

%%% c)
% The Eigenvalue that is shared between each of the matrices A, B, C, D is
% 0. This is because A, B, C, D are all non-invertible matrices, so they
% have to have 0 as an eigenvalue. 0 can only be an eigenvalue of a matrix
% if and only if the matrix is non-invertible.

%% Question 3
A_3 = [7 6 -2; -8 -7 2; 2 1 -1]

%%% a)
[P_3,D_3] = eig(A_3)

A_3_check = P_3*D_3*inv(P_3)
A_3_check_compare = int64(real(A_3_check))

%%% b)
if(A_3 == A_3_check_compare)
    fprintf("A_3 and PDP^-1 are in fact equal! Woohoo!\n")
end

%%% c)
%
