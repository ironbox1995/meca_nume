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

dt6=0.001;
T0 = 1.5;
t6=(0:dt6:T0)';
np6=size(t6,1);
q0=0;
dq0=0;
q6=zeros(np6,1);
dq=zeros(np6,1);
q6(1)=q0;
dq6(1)=dq0;
qj=[q0;dq0];
for inc=2:np6
    tc=t6(inc-1);
    xc=qj;
    k1=cal_fe(xc,tc,w0c);
    xc=qj+k1*dt6/2;
    k2=cal_fe(xc,tc+dt6/2,w0c);
    xc=qj+k2*dt6/2;
    k3=cal_fe(xc,tc+dt6/2,w0c);
    xc=qj+k3*dt6/2;
    k4=cal_fe(xc,tc+dt6,w0c);
    dq=(k1+2*k2+2*k3+k4)/6;
    qj=qj+dq*dt6;
    q6(inc)=qj(1);
    dq6(inc)=qj(2);
end

figure(1)
plot(dq6,q6)
figure(2)
plot(t6,dq6)


    