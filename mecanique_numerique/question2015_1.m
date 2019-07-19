clear all; 
close all; 
clc; 
% w0=2*pi;
% w0c=w0^2;

dt6=0.01;
T0 = 2;
t6=(0:dt6:T0)';
np6=size(t6,1);
q0=0.25*cosh(0)*cosh(0)+1;
dq0=sinh(0)*sqrt(q0-1);
q6=zeros(np6,1);
dq=zeros(np6,1);
q6(1)=q0;
dq6(1)=dq0;
qj=[q0;dq0];
for inc=2:np6
    tc=t6(inc-1);
    xc=qj;
    k1=cal_q(xc,tc);
    xc=qj+k1*dt6/2;
    k2=cal_q(xc,tc+dt6/2);
    xc=qj+k2*dt6/2;
    k3=cal_q(xc,tc+dt6/2);
    xc=qj+k3*dt6/2;
    k4=cal_q(xc,tc+dt6);
    dq=(k1+2*k2+2*k3+k4)/6;
    qj=qj+dq*dt6;
    q6(inc)=qj(1);
    dq6(inc)=qj(2);
end
plot(t6,q6)
