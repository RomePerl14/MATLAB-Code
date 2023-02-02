%%%%%% Computing Integrals %%%%%%
%%%%%% Romeo Perlstein %%%%%%

%%%% declare syms variables %%%%
syms x;
upper_bound = 1;
lower_bound = 0;

%%%% declare the functions for use %%%%
func = sqrt(1+(x^4));
func_numEval = @(x) sqrt(1+(x.^4));

%%%% solve the functions and save them into variables... because... %%%%
disp(' ')
disp('------ regular integration ------')
regular_int = int(func, lower_bound, upper_bound)
disp('------ solving the hypergeom function ------')
vpa(regular_int)

disp('------ numerical integration ------')
numerical_int = integral(func_numEval, lower_bound, upper_bound)

%%%% EZ PZ %%%%
