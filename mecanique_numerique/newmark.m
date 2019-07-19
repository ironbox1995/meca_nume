clear all; close all; clc; format short e;
%dt1 = sym('dt1','real'); w0 = sym('w0','real');
w0 = 2*pi;
dt1 = 0.5*2/w0;
%be = sym('be','real'); ga = sym('ga','real');
be = 0; 
ga = 0.5;
A = [1-dt1*dt1*(0.5-be)*w0*w0,dt1;-(1-ga)*dt1*w0*w0,1];
B = [1+be*dt1*dt1*w0*w0,0;ga*dt1*w0*w0,1];
%vecteur et valeur propres
[z,d] = eig((inv(B))*A);
% z 是过渡矩阵
% d 是对角矩阵
re = real(d);
im = imag(d);
mo = abs(d);
% mo = simplify(mo);
% C est matrice initiale! apres changement de base!
zm = inv(z);
C = z*(d*zm);
% C = simplify(C);
d
mo