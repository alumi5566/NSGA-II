function f = evaluate_objective(x, M, V, max_range)

%% function f = evaluate_objective(x, M, V)
% Function to evaluate the objective functions for the given input vector
% x. x is an array of decision variables and f(1), f(2), etc are the
% objective functions. The algorithm always minimizes the objective
% function hence if you would like to maximize the function then multiply
% the function by negative one. M is the numebr of objective functions and
% V is the number of decision variables. 
%
% This functions is basically written by the user who defines his/her own
% objective function. Make sure that the M and V matches your initial user
% input. Make sure that the 
%
% An example objective function is given below. It has two six decision
% variables are two objective functions.

% f = [];
% %% Objective function one
% % Decision variables are used to form the objective function.
% f(1) = 1 - exp(-4*x(1))*(sin(6*pi*x(1)))^6;
% sum = 0;
% for i = 2 : 6
%     sum = sum + x(i)/4;
% end
% %% Intermediate function
% g_x = 1 + 9*(sum)^(0.25);
% 
% %% Objective function two
% f(2) = g_x*(1 - ((f(1))/(g_x))^2);

%% Kursawe proposed by Frank Kursawe.
% Take a look at the following reference
% A variant of evolution strategies for vector optimization.
% In H. P. Schwefel and R. Männer, editors, Parallel Problem Solving from
% Nature. 1st Workshop, PPSN I, volume 496 of Lecture Notes in Computer 
% Science, pages 193-197, Berlin, Germany, oct 1991. Springer-Verlag. 
%
% Number of objective is two, while it can have arbirtarly many decision
% variables within the range -5 and 5. Common number of variables is 3.
f = [];
N = [];
Ccost= [];
Fcost = [];
%=============Parameter=============
%a1 = 108; a2 = 294; a3 = 117;
b1 = 0.045; b2 = 0.0323; b3 = 0.058;
c1 = 0.05; c2 = 0.007; c3 = 0.003;
%t1 = 15; t2 = 16; t3 = 16
%===================================
a1 = 320; a2 = 766; a3 = 315;
%b1 = 0.032; b2 = 0.076; b3 = 0.0429;
%c1 = 0.07; c2 = 0.015; c3 = 0.035;
t1 = 32; t2 = 31; t3 = 32;
%===================================
%a1 = 7128; a2 = 9927; a3 = 9004;
%b1 = 0.0387; b2 = 0.0326; b3 = 0.0481;
%c1 = 0.0438; c2 = 0.057; c3 = 0.0526;
%t1 = 90; t2 = 76; t3 = 98;
%===================================

%N1 = a1*(exp(-b1*max_range(1)))*(exp(-c1*x(1)));
N1 = a1*(exp(-b1*t1))*(exp(-c1*x(1)));
N2d = a2 + N1;
%N2 = N2d*(exp(-b2*max_range(2)))*(exp(-c2*x(2)));
N2 = N2d*(exp(-b2*t2))*(exp(-c2*x(2)));
N3d = a3 + N2;
%N3 = N3d*(exp(-b3*max_range(3)))*(exp(-c3*x(3)));
N3 = N3d*(exp(-b3*t3))*(exp(-c3*x(3)));
f(1) = N3*-1;
   
%Ccost(1) = a1*(exp(-b1*max_range(1)));
%Ccost(2) = N2d - a1*(exp(-b1*max_range(1)));
%Ccost(3) = N3d - N2d*(exp(-b2*max_range(2)));
%Fcost(1) = N1- a1*(exp(-b1*max_range(1)));
%Fcost(2) = N2 - N2d*(exp(-b2*max_range(2)));
   
Ccost(1) = a1*(exp(-b1*t1));
Ccost(2) = N2d - a1*(exp(-b1*t1));
Ccost(3) = N3d - N2d*(exp(-b2*t2));
Fcost(1) = N1- a1*(exp(-b1*t1));
Fcost(2) = N2 - N2d*(exp(-b2*t2));

f(2) = 10*(x(1)+x(2)+x(3)) + 2*(Ccost(1)+Ccost(2)+Ccost(3)) +5*(Fcost(1)+Fcost(2));

if (M ==3)
    f(3) = x(1)+x(2)+x(3); 
end
   
%% Check for error
if length(f) ~= M
    error('The number of decision variables does not match you previous input. Kindly check your objective function');
end
