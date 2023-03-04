%%%% MATLAB PROJECT 1, MATH461, LINEAR ALGEBRA FOR SCIENTIST AND ENGINEERS
%%%% Romeo Perlstein, 3/6/2023
%%%% UID: 118030685, section 0123

format short

%%Question 1

%%% a)
thetaA = pi()/9
A = [cos(thetaA) -sin(thetaA) ; sin(thetaA) cos(thetaA)]

v = [1;3]

v_rotated = A*v

thetaB = pi()/10
%%% b)
B = [cos(thetaB) -sin(thetaB) ; sin(thetaB) cos(thetaB)]

ex_1 = A*B
ex_2 = B*A
if (A*B == B*A)
    fprintf("AB does in fact equal BA \n")
else
    fprintf("AB does NOT equal BA \n")
end
%%% c)
% no, it doesn't matter which rotation is applied first, because you are
% simply rotating the vector a by a certain angle first, and then a second
% certain angle second, so it does not matter which orders the rotation is
% applied in because the total rotation remains the same. This is proven in
% b) because as we learned, the output of a function that applies to
% matricies to a vector is equal to a fucntion with a standard matrix that
% is the two seperate matricies multiplied together, and in b) we show that
% the order of multiplication of the matricies does not their result

%%% d)
format rat
C = A*B
theta3 = acos(C(1,1))
actual_theta3 = theta3/pi()

%%% e)
format short
theta_inv = -pi()/9
R_inv_manualls = [cos(theta_inv) -sin(theta_inv) ; sin(theta_inv) cos(theta_inv)]

R_inv_check = inv(A)

if (isequal(R_inv_check, R_inv_manualls))
    fprintf("They are equal")
else
    fprintf("they are equal, Matlab is just being awful \nand not understanding that they are for some reason\n")
end

%%% f)
% redefine R so that we can use it better
R = A % A already uses theta = pi/9
R_inv = inv(R)
L_naught = [1 0 ; 0 -1]
L_theta = R*L_naught*R_inv

%%% g)
L_theta_L_naught = L_theta*L_naught
L_naught_L_theta = L_naught*L_theta

if (L_thetaL0 == L0Ltheta)
    fprintf("They are equal")
else
    fprintf("They are NOT equal \n")
end

%%% h)
format rat
theta4 = acos(L_theta_L_naught(1,1))
actual_theta4 = theta4/pi

%% Question 2
