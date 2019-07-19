clear all; 
close all; 
clc;

% Ô­·½³Ì ddqc = -w0c*sin(q1(inc));
% res = ddqc + w0c*sin(qc)

k = 2464;
A = 5;
m = 0.1;
a = 0.4;
eps = 0.05;
w0c = k/m;
w0 = sqrt(w0c);


dt3 = 0.001;
T0 = 1.5;
t3 = (0:dt3:T0)';
np3 = size(t3,1);
q3 = zeros(np3,1);
dq3 = zeros(np3,1);
ddq3 = zeros(np3,1);
energ3 = zeros(np3,1);
residu = zeros(np3,1);
niter = zeros(np3,1);
threshold = 1e-8;
nitermax = 200;

q0 = 0;
dq0 = 0;


gam = 0.5;
gam1 = (1-gam)*dt3;
gam2 = gam*dt3;
bet = 0.25;
bet1 = (0.5-bet)*dt3*dt3;
bet2 = bet * dt3 * dt3;
q3(1) = q0;
dq3(1) = dq0;
ddq3(1) = 50 - 2*0.05*dq0-w0c*q0*(1-0.4*q0*q0);

for inc = 2:np3
    ddqc = 0;
    dqc = dq3(inc - 1)+gam1*ddq3(inc -1);
    qc = q3(inc - 1) + dt3 * dq3(inc-1) + bet1*ddq3(inc-1);
    res =ddqc+2*eps*w0*dqc+w0c*qc*(1-0.4*qc*qc);
    iter = 0;
    for it = 1:nitermax
        if(abs(res)>=threshold)
            iter = iter + 1;
            correction = -res/(1 + w0c*bet2*cos(qc));
            ddqc = ddqc + correction;
            dqc = dqc + gam2 * correction;
            qc = qc + bet2 * correction;
            res = ddqc+2*eps*w0*dqc+w0c*qc*(1-0.4*qc*qc);
        end
    end
    q3(inc) = qc;
    dq3(inc) = dqc;
    ddq3(inc) = ddqc;
    niter(inc) = iter;
    residu(inc) = res;
end

figure(1)
plot(t3,q3); 
figure(2)
plot(t3,dq3);  

disp(q3(1))
disp(dq3(1))
disp(ddq3(1))
disp(q3(51))
disp(dq3(51))
disp(ddq3(51))
disp(q3(501))
disp(dq3(501))
disp(ddq3(501))
disp(q3(1501))
disp(dq3(1501))
disp(ddq3(1501))

