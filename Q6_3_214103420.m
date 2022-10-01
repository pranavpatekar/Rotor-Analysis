% Exercise 6.3
clear all
clc
disp("Exercise 6.3: ")

% Input Data:

syms w
syms T
phi3 = 0;
phi0 = 0;
G = 0.8e11;
d = 0.01;
Ip1 = 0.08;
Ip2 = 0.2;
b1d1 = 0.05;
d1d2 = 0.075;
d2b2 = 0.05;

J = pi*d^4/32;
kt1 = G*J/b1d1;
kt2 = G*J/d1d2;
kt3 = G*J/d2b2;

% Field Matrices:
disp('Field Matrices:')

F1 = [1 1/kt1;
      0 1]
F2 = [1 1/kt2;
      0 1]
F3 = [1 1/kt3;
      0 1]

% Point Matrices:
disp('Point Matrices:')
P1 = [1 0;
      -Ip1*w^2 1]
P2 = [1 0;
      -Ip2*w^2 1]
assume(w, 'real')
assume(w, 'positive')

% Transfer Matrix:

T = F3*P2*F2*P1*F1
eqn = T(1,2) == 0;

% Natural Frequencies:
disp('Natural Frequencies:')
soln = solve(eqn, w)

% I am getting the anwers in the form of an expression/fraction for some
% reason, need to copy and paste the expressions to get the answers.