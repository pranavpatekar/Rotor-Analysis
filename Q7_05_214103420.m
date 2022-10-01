% Exercise 7.5
clear all
clc
disp("Exercise 7.5: ")

% Input Data:
syms w
syms lamda

d = 0.01;
l = 0.5;

Ip1 = 0.02;
Ip2 = 0.08;
G = 0.8e11;

J = (pi*d^4)/32;

rho = 7800;

% Considering Mass of Shaft:
% Element 1:
M1 = (rho * J * l)*[2 + Ip1/(rho * J * l) 1; 1 2];
K1 = (G*J/l)*[1 -1; -1 1];

% Element 2:
M2 = (rho * J * l)*[2 1; 1 2 + Ip2/(rho * J * l)];
K2 = (G*J/l)*[1 -1; -1 1];



disp('Mass Matrix:')
M = zeros(3,3);
M([1,2],[1,2]) = M([1,2],[1,2]) + M1;
M([2,3],[2,3]) = M([2,3],[2,3]) + M2

disp('Stiffness Matrix:')
K = zeros(3,3);
K([1,2],[1,2]) = K([1,2],[1,2]) + K1;
K([2,3],[2,3]) = K([2,3],[2,3]) + K2





D = -(w^2)*M + K;
eqn = det(D) == 0;
assume(w, 'real');
assume(w, 'positive');
disp('Natural Frequencies considering mass of shaft:')

w = solve(eqn, w)
w = 0






% Without Mass of shaft
% Element 1:
M1s = [Ip1 0; 0 0];
K1s = (G*J/l)*[1 -1; -1 1];

% Element 2:
M2s = [0 0; 0 Ip2];
K2s = (G*J/l)*[1 -1; -1 1];



disp('Mass Matrix:')
Ms = zeros(3,3);
Ms([1,2],[1,2]) = Ms([1,2],[1,2]) + M1s;
Ms([2,3],[2,3]) = Ms([2,3],[2,3]) + M2s

disp('Stiffness Matrix:')
Ks = zeros(3,3);
Ks([1,2],[1,2]) = Ks([1,2],[1,2]) + K1s;
Ks([2,3],[2,3]) = Ks([2,3],[2,3]) + K2s





Ds = -Ms + (lamda^2)*Ks;
eqns = det(Ds) == 0;
assume(lamda, 'real');
assume(lamda, 'positive');
lamda = solve(eqns, lamda)
disp('Natural Frequencies without considering mass of shaft:')
w = 0
w = 1/lamda