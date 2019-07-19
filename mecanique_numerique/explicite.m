clear all; close all; clc
t0=3;
w0=2*pi;
w0c = w0*w0;
q0=1;
dq0=0.0;
dt1=0.01;
t1=(0:dt1:t0)';
np1=size(t1,1);
q1=zeros(np1,1);
dq1=zeros(np1,1);
ddq1=zeros(np1,1);
energ1=zeros(np1,1);
q1(1)=q0;
dq1(1)=dq0;
ddq1(1)=-w0c*q1(1);

for inc=2:np1
    q1(inc)=q1(inc-1)+dt1*dq1(inc-1);
    dq1(inc)=dq1(inc-1)+dt1*ddq1(inc-1);
    ddq1(inc)=-w0c*q1(inc);
end;
ener1=0.5*(dq1.*dq1+w0c*(q1.^2));
plot(t1,q1,'Linewidth',3)
