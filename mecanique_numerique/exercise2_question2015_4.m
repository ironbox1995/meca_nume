% gam = 0.5 bet = 0.25
%
clear all; 
close all; 
clc; 
T0 = 20;
gam = 0.5;
bet = 0.25;
dt4 = 0.01;
gam1 = (1-gam)*dt4;
gam2 = gam*dt4;
bet1 = (0.5-bet)*dt4*dt4;
bet2 = bet * dt4 * dt4;
nitermax = 20;
threshold = 1e-8;
%
t4 = (0:dt4:T0)';
np3 = size(t4,1);
% 
q10 = 0.5;
q20 = 0.5;
dq10 = 0.;
dq20 = 0.2;
%
q3 = zeros(np3,1); dq3 = zeros(np3,1); ddq3 = zeros(np3,1);
q4 = zeros(np3,1); dq4 = zeros(np3,1); ddq4 = zeros(np3,1);
% 
q3(1) = q10;
dq3(1) = dq10;
%
q4(1) = q20;
dq4(1) = dq20;
k1 = 3; k2 = 4; k3 = 12;
m1 = 1; m2 = 4;
%
ddq3(1) = (-1*(k1+k2)*q3(1)+k2*q4(1))/m1;
ddq4(1) = (-1*(k3+k2)*q4(1)+k2*q3(1))/m2;
res1 = m1*ddq3(1)+((k1/+k2)*q3(1)-k2*q4(1));
res2 = m2*ddq4(1)+((k2/+k3)*q4(1)-k2*q3(1));
residu(1) = (abs(res1)^2+abs(res2)^2)^0.5;
KT = [0 0;0 0];
for inc= 2:np3
    ddq3c = 0; ddq4c = 0;
    dq3c = dq3(inc-1)+gam1*ddq3(inc-1);
    q3c = q3(inc-1)+ dt4*dq3(inc-1)+bet1*ddq3(inc-1);
    dq4c = dq4(inc-1)+gam1*ddq4(inc-1);
    q4c = q4(inc-1)+ dt4*dq4(inc-1)+bet1*ddq4(inc-1);  
    res1 = m1*ddq3c+((k1+k2)*q3c-k2*q4c);
    res2 = m2*ddq4c+((k3+k2)*q4c-k2*q3c);
    KT = [m1+(k1+k2)*bet2,-k2*bet2;-k2*bet2,m2+(k2+k3)*bet2];
    hj = KT\[-res1;-res2];res = ((abs(hj(1))^2+abs(hj(2))^2)^0.5);
    iter = 0;
    
    for it=1:nitermax
        if(abs(res)>=threshold)
            iter=iter+1;
            KT=[m1+(k1+k2)*bet2 -k2*bet2;-k2*bet2 m2+(k2+k3)*bet2];
            hj=KT\[-res1;-res2];correction1=hj(1);correction2=hj(2);
            ddq3c=ddq3c+correction1;
            ddq4c=ddq4c+correction2;
            dq3c=dq3c+gam2*correction1;
            dq4c=dq4c+gam2*correction2;
            q3c=q3c+bet2*correction1;
            q4c=q4c+bet2*correction2;
            res1=ddq3c+((k1+k2)*q3c-k2*q4c)/m1;
            res2=ddq4c+((k2+k3)*q4c-k2*q3c)/m2;
            res=((abs(res1)^2+abs(res2)^2)^0.5);
        end
    end
    q3(inc)=q3c;
    q4(inc)=q4c;
    dq3(inc)=dq3c;
    dq4(inc)=dq4c;
    ddq3(inc)=ddq3c;
    ddq4(inc)=ddq4c;
    niter(inc)=iter;
    residu(inc)=res;
end
plot(t4,q3);hold on;
plot(t4,q4)
