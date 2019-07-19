clear all;
close all;
clc

k = 2464;
A = 5;
m = 0.1;
a = 0.4;
eps = 0.05;
w0c = k/m;
w0 = sqrt(w0c);

dt1 = 0.001;
T0 = 1.5;
t1 = (0:dt1:T0)';
np1 = size(t1,1);
q1 = zeros(np1,1);
dq1 = zeros(np1,1);
energ1 = zeros(np1,1);

q0 = 0;
dq0 = 0;


q1(1) = q0;
dq1(1) = dq0;
ddq0c = 50 - 2*0.05*dq0-w0c*q0*(1-0.4*q0*q0);

for inc = 2:np1
    q1(inc) = q1(inc-1)+dt1*dq1(inc-1)+dt1*dt1*0.5*ddq0c;
    ddqc = 50*cos(w0*inc*dt1)-2*0.05*dq1(inc)-w0c*q1(inc)*(1-0.4*q1(inc)*q1(inc));
    dq1(inc) = dq1(inc-1)+0.5*dt1*(ddq0c+ddqc);
    ddq0c = ddqc;
end

energ1 = 0.5*(dq1 .*dq1) - w0c * cos(q1);
figure(1)
plot(t1,q1); 
figure(2)
plot(t1,dq1);  
disp(q1(1))
disp(dq1(1))
disp(q1(51))
disp(dq1(51))
disp(q1(501))
disp(dq1(501))
disp(q1(1501))
disp(dq1(1501))