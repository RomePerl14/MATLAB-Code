%%%%%%%% Solving for multiple equations at once, and more! %%%%%%%%
%% Romeo Perlstein %%

syms xvar yvar;
equn1 = (xvar^2) - yvar^2;
equn2 = (2*xvar) + yvar;
ans1 = 1;
ans2 = 2;

%% Output answer %%
[xAns, yAns] = solve([equn1 == ans1, equn2 == ans2]);

%% Now work to plot the functions %%

func1 = -(2*xvar) + 2;
func2 = sqrt((xvar^2-1));
func3 = -func2;

xAns_real = double(xAns);
yAns_real = double(yAns);




hold on
fplot(func1, [-5 5]);
fplot(func2, [-5 5]);
fplot(func3, [-5 5]);

xline(xAns_real);
yline(yAns_real);

%% EZ PZ %%


