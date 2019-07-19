clear all; close all; clc
T0 = 3; w0 = 2*pi; w0c = w0 * w0;
q0 = 1; dq0 = 0.0; dte = 0.01;
te = (0:dte:T0)';
npe = size(te,1);
qe = zeros(npe,1);
dqe = zeros(npe,1);
energe = zeros(npe,1);
tic;
qe = q0*cos(w0*te) + dq0/w0*sin(w0*te);
dqe = -w0*q0*sin(w0*te)+dq0*cos(w0*te);
ddqe = -w0c*qe;
energe = 0.5*(dqe.*dqe + w0c.*(qe.^2)); toc;
plot(te,qe,te,dqe,te,ddqe,'-r','Linewidth',2)