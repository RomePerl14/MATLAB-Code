% a1 = [1:1:100];
% a2 = [1:1:100];
% A = [a1 a2]
% 
% b1 = [1:1:100];
% b2 = [1:1:100];
% B = [b1 b2]
syms x1 x2;

X =[x1;x2];

format short
range = 1:15;
count = 1;
for i = range
    for j = range
        for k = range
            for l = range
                A = [i j];
                B = [k l];
                sol(count) = solve([abs(A*X)==abs(B*X),1==sqrt(x1^2+x2^2)],[x1,x2]);
%                 sol(count) = solve(abs(A*X) == abs(B*X), [x1, x2]);
                
                
                if (abs(sol(count).x1) < .000001)
                    sol(count).x1 = 0;
                end
                if (abs(sol(count).x2) < .000001)
                    sol(count).x2 = 0;
                end

%                 disp("New Solution:")
%                 A
%                 B
%                 sol(count).x1
%                 sol(count).x2
                if (sol(count).x1 ~= 0 | sol(count).x2 ~= 0)
                    disp("New Solution:")
                    A
                    B
                    sol(count).x1
                    sol(count).x2
%                     fprintf("big fat juicy balls \n")
                end
                count = count +1;
            end
        end
    end
end
% X=[-1/(sqrt(2));1/(sqrt(2))]
% A = [3 3]
% A*X
% B = [2 1]
% B*X
for i = 1:count-1
    x1_1(i) = sol(i).x1(1);
    try (sol(i).x1(2))
        x1_2(i) = sol(i).x1(2);
    catch 
%         fprintf("no second element \n")
        x1_2(i) = -2;
    end  
end
hold on
plot([1:7100],x1_1(1:7100))
plot([1:7100],x1_2(1:7100))
title("balls")