%%%%%%%% Solving for multiple equations at once, and more! %%%%%%%%
%%%%%%%% Romeo Perlstein %%%%%%%%

%%%% setup the equations for use %%%%
syms xvar yvar;
equn1 = (xvar^2) - yvar^2;
equn2 = (2*xvar) + yvar;
ans1 = 1;
ans2 = 2;

%%%% Output answer %%%%
[xAns, yAns] = solve([equn1 == ans1, equn2 == ans2])

%%%% Now work to plot the functions %%%%

func1 = -(2*xvar) + 2;
func2 = sqrt((xvar^2-1));
func3 = -func2;

xAns_real = double(xAns);
yAns_real = double(yAns);



title('Plot of first and second functions, as well as x and y intercepts');
xlabel('x-axis');
ylabel('y-axis');
hold on
fplot(func1, [-5 5], "-r");
fplot(func2, [-5 5], "-b");
fplot(func3, [-5 5], "-b");

xline(xAns_real, "-g");
yline(yAns_real, "-m");

%%%% EZ PZ %%%%


