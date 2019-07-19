clear all; close all; clc;
dt1=sym('dt1','real');
w0=sym('w0','real');
A=[1,-dt1,0; 0,1,-dt1;w0*w0,0,1];
B=[1,0,0;0,1,0;0,0,0];
C = A\B;
% identique C = inv(A)*B
% Vecteur et valeurs propres
[z,d]=eig(C);
simplify(d)
mo = abs(d);
% module<1?   si oui system est stable
eval(mo)
