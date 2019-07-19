%euler_implicite
clear all; 
close all; 
clc; 
dt3 = 0.05;
T0 = 2;
t3 = (0:dt3:T0)';
np3 = size(t3,1);
q3 = zeros(np3,1);
dq3 = zeros(np3,1);
% ddq3 = zeros(np3,1);
% energ3 = zeros(np3,1);
% residu = zeros(np3,1);
% niter = zeros(np3,1);
% threshold = 1e-8;
% nitermax = 20;

q0=0.25*cosh(0)*cosh(0)+1;
dq0=sinh(0)*sqrt(q0-1);

t = 0;
q3(1) = q0;
dq3(1) = dq0;
for inc=2:np3;
    % t = t + dt3;
    q3(inc)=q3(inc-1)+dt3*dq3(inc-1);
    dq3(inc)= sinh(t3(inc-1))*sqrt(q3(inc-1)-1);
end;
% energ3 = 0.5 * (dq3.*dq3) - w0c * cos(q3) ;
figure(1)
plot(t3,q3); 
% figure(2)
% plot(t3,dq3);  
% figure(3)
% plot(t3,energ3);