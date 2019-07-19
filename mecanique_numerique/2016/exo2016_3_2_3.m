% 1 2题参见15年
clear all;
close all;
K=[3 -1;-1,3];
M=[2 0;0 2];
w0c=M\K;

T0=10;
dt3    = 0.01;
t3 = (0:dt3:T0)';
np3    = size(t3,1);
q3     = zeros(2,np3)     ;
dq3    = zeros(2,np3)        ;
ddq3    = zeros(2,np3)       ;
energ3 = zeros(2,np3);         
residu = zeros(2,np3);         
niter = zeros(np3,1) ;        
threshold = 1e-16 ;            
nitermax = 20  ;
gam = 0.5;                   
gam1 = (1-gam)*dt3  ;         
gam2 = gam*dt3     ;        
bet = 0.25   ;               
bet1 = (0.5-bet)*dt3*dt3  ; 
bet2 = bet*dt3*dt3;
q3(1,1)=pi/4;
q3(2,1)=pi/4;
dq3(1,1)=0.5;
dq3(2,1)=0;
ddq3(:,1)=-w0c*q3(:,1);
correction=zeros(2,1);
for inc = 2 : np3
    ddqc = [0;0] ;
    dqc = dq3(:,inc-1) + gam1 * ddq3(:,inc-1)      ; 
    qc = q3(:,inc-1) + dt3 * dq3(:,inc-1) + bet1*ddq3(:,inc-1) ; 
    res = ddqc + w0c * sin(qc)                 ; 
    iter = 0                                   ; 
    for iter= 1:nitermax
        if (abs(res(1))*abs(res(1))+abs(res(2))*abs(res(2)) >= threshold) 
            correction = ([1 0;0 1]+ w0c * [bet2*cos(qc(1)) 0;0 bet2*cos(qc(2))])\(-res) ;
            ddqc = ddqc + correction ; 
            dqc = dqc + gam2 * correction ; 
            qc = qc + bet2 * correction ;
            res = ddqc + w0c * sin(qc); 
        end
    end
    q3(:,inc) = qc ; 
    dq3(:,inc) = dqc ;
    ddq3(:,inc) = ddqc ;
    niter(inc) = iter ; 
    residu(:,inc) = res ; 
end
figure(1)
plot(t3,q3);

t0 = 0;
tfinal = 10;
x0 =[pi/4 pi/4,0.5 0];
[t,x] = ode45('fun', [t0 tfinal],x0);
figure(2) 
plot(t,x(:,1),'-b',t,x(:,2),'-r', 'Linewidth',2)