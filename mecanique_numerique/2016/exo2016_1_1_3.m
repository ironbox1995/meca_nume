clear all; close all; clc
T0 = 2;
dt1 =0.04;
te = (0:dt1:T0)';
np1 = size(te,1);
q1 = zeros(np1,1);
qs= zeros(np1,1);
er= zeros(np1,1);
niter = zeros(np1,0) ;
q1(1) = 1;
nitermax = 20;
threshold = 1e-10;
tic;
for inc=2:np1
    iter = 0;
    q1c=q1(inc-1);
    qs(inc) = 1/(1+(inc-1)*dt1*(inc-1)*dt1);
    for it=1:nitermax
        iter = iter+1;
        ex=q1c;
        q1c=q1c-(q1c-q1(inc-1)+2*(inc-1)*dt1*dt1*q1c*q1c)/(1+4*(inc-1)*dt1*dt1*q1c);
        ep = q1c-ex;
        if (abs(ep) <= threshold)
            q1(inc) = q1c;
            break;
        end
    end;
    niter(inc) = iter;
    er(inc) = q1(inc) - qs(inc);
end;
toc;
figure(1);
title('q-t');
xlabel('t');ylabel('q');
plot(te,q1);
figure(2);
title('niter-t');
xlabel('t');ylabel('niter');
plot(te,niter);