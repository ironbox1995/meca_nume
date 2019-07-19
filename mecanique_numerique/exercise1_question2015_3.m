% gam = 0.5 bet = 0.
clear all; 
close all; 
clc; 
T0 = 20;
dt4 = 0.01;
t4 = (0:dt4:T0)';
np4 = size(t4,1);
% 
q10 = 0.5;
q20 = 0.5;
dq10 = 0.;
dq20 = 0.2;
%
q5 = zeros(np4,1); dq5 = zeros(np4,1); ddq5 = zeros(np4,1);
q6 = zeros(np4,1); dq6 = zeros(np4,1); ddq6 = zeros(np4,1);
% 
q5(1) = q10;
dq5(1) = dq10;
%
q6(1) = q20;
dq6(1) = dq20;
k1 = 3; k2 = 4; k3 = 12;
m1 = 1; m2 = 4;
% 
ddq5(1) = (-1*(k1+k2)*q5(1)+k2*q6(1))/m1;
ddq6(1) = (-1*(k3+k2)*q6(1)+k2*q5(1))/m2;

%sys lineaire diff 2e ordre

%...

for inc = 2:np4
    q5(inc)=q5(inc-1)+dt4*dq5(inc-1)+0.5*dt4*dt4*ddq5(inc-1);
    q6(inc)=q6(inc-1)+dt4*dq6(inc-1)+0.5*dt4*dt4*ddq6(inc-1);
    
    ddq5(inc)=(-1*(k1+k2)*q5(inc)+k2*q6(inc))/m1;
    ddq6(inc)=(-1*(k2+k3)*q6(inc)+k2*q5(inc))/m2;
    
    dq5(inc)=dq5(inc-1)+0.5*dt4*(ddq5(inc-1)+ddq5(inc));
    dq6(inc)=dq6(inc-1)+0.5*dt4*(ddq6(inc-1)+ddq6(inc));
end
% figure(1);
% plot(q6,dq6,'r*','LineWidth',3)
% xlabel('q6');
% ylabel('dq6');
% title('q');
% grid
% title('equation diff - newmark explicite')
% disp(q6(3))
figure(1);
plot(t4,q5);
figure(2);
plot(t4,q6);