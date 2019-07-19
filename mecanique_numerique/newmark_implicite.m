clear all; 
close all; 
clc;

% Ô­·½³Ì ddqc = -w0c*sin(q1(inc));

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

gam = 0.5;
gam1 = (1-gam)*dt3;
gam2 = gam*dt3;
bet = 0.25;
bet1 = (0.5-bet)*dt3*dt3;
bet2 = bet * dt3 * dt3;
q3(1) = q0;
dq3(1) = dq0;
ddq3(1) = -w0c * sin(q0);

for inc = 2:np3
    ddqc = 0;
    dqc = dq3(inc - 1)+gam1*ddq3(inc -1);
    qc = q3(inc - 1) + dt3 * dq3(inc-1) + bet1*ddq3(inc-1);
    res = ddqc + w0c*sin(qc);
    iter = 0;
    for it = 1:nitermax
        if(abs(res)>=threshold)
            iter = iter + 1;
            correction = -res/(1 + w0c*bet2*cos(qc));
            ddqc = ddqc + correction;
            dqc = dqc + gam2 * correction;
            qc = qc + bet2 * correction;
            res = ddqc + w0c * sin(qc);
        end
    end
    q3(inc) = qc;
    dq3(inc) = dqc;
    ddq3(inc) = ddqc;
    niter(inc) = iter;
    residu(inc) = res;
end

energ3 = 0.5*(dq3.*dq3) - w0c * cos(q3);
figure(1)
plot(t3,q3); 
figure(2)
plot(t3,dq3);  
figure(3)
plot(t3,energ3);
