% Exercise 6.23
clear all
clc
disp("Exercise 6.23: ")

% Input Data:
disp('Input Data:')
syms w


Ip1 = 0.02;
Ip2 = 0.03;

d = 0.015;
G = 0.8e11;
n = 2;
l = 0.2;
J = pi*(d^4)/32;
kt1 = G*J/l;
kt3 = G*J/l;

% Point Matrices:
disp('Point Matrices:')
P0 = [1 0;
      -Ip1*w^2 1]
P1 = [1 0;
      0 1]
P2 = [1 0;
      0 1]
P3 = [1 0;
      -Ip2*w^2 1]

% Gear Ratio Transformation Matrix:
disp('Gear Ratio Transformation Matrix:')
N = -[1/n 0;
      0 n]

% Field Matrices:
disp('Field Matrices:')
F1 = [1 1/kt1;
      0 1]
F3 = [1 1/kt3;
      0 1]

% Transfer Matrix:
disp('Transfer Matrix:')
T = P3*F3*P2*N*P1*F1*P0
assume(w, 'real')
assume(w, 'positive')

eqn = T(2,1) == 0;

% Natural Frequency:
disp('Natural Frequency:')
soln = solve(eqn, w)

% I am getting the answers in the form of an expression/fraction for some
% reason, need to copy and paste the expressions to get the answers.