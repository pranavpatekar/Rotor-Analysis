% Exercise 7.11
clear all
clc
disp("Exercise 7.11: ")

% Input Data:
syms w

d1 = 0.003;
d2 = 0.001;

Ip = 0.01;
l1 = 0.04;
l2 = 0.06;

G = 0.8e11;

J1 = (pi*d1^4)/32;
J2 = (pi*d2^4)/32;

rho = 7800;


% Element 1:
M1 = (rho*J1*l1/6)*[2 1; 1 2];
K1 = (G*J1/l1)*[1 -1; -1 1];

%Element 2:
M2 = (rho*J2*l2/6)*[2 1; 1 2 + Ip/(rho*J2*l2/6)];
K2 = (G*J2/l2)*[1 -1; -1 1];

disp('Mass Matrix: ')
M = zeros(3,3);
M([1,2],[1,2]) = M([1,2],[1,2]) + M1;
M([2,3],[2,3]) = M([2,3],[2,3]) + M2

disp('Stiffness Matrix: ')
K = zeros(3,3);
K([1,2],[1,2]) = K([1,2],[1,2]) + K1;
K([2,3],[2,3]) = K([2,3],[2,3]) + K2

% Applying Boundary Conditions 
disp('Reduced Mass Matrix: ')
M_reduce = M([2,3],[2,3])

disp('Reduced Stiffness Matrix:')
K_reduce = K([2,3],[2,3])

D = -(w^2)*M_reduce + K_reduce;
eqn = det(D) == 0;
assume(w, 'real');
assume(w, 'positive');
disp('Natural Frequencies:')
w = solve(eqn, w)