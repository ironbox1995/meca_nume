%euler_implicite
clear all; 
close all; 
clc; 
dt3 = 0.01;
T0 = 6;
t3 = (0:dt3:T0)';
np3 = size(t3,1);
q3 = zeros(np3,1);
dq3 = zeros(np3,1);
ddq3 = zeros(np3,1);
energ3 = zeros(np3,1);
residu = zeros(np3,1);
niter = zeros(np3,1);
threshold = 1e-8;
nitermax = 20;

q0 = pi/3;
dq0 = 0;
w0 = 2*pi;
w0c = w0*w0;

q3(1) = q0;
dq3(1) = dq0;
ddq3(1) = -w0c * sin(q0);
for inc=2:np3;
    q3(inc)=q3(inc-1)+dt3*dq3(inc-1);
    dq3(inc)=dq3(inc-1)+dt3*ddq3(inc-1);
    ddq3(inc)=-w0c*sin(q3(inc));
end;
energ3 = 0.5 * (dq3.*dq3) - w0c * cos(q3) ;
figure(1)
plot(t3,q3); 
figure(2)
plot(t3,dq3);  
figure(3)
plot(t3,energ3);