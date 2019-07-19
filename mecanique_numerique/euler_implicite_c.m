% Pendule simple (Non-lineaire)
% Schema euler implicite
close all;
clc;
clear;
% initialisation
w0 = 2*pi;
dt = 0.02;
Tt = 6;
te = (0:dt:Tt);
[mp,np] = size(te);
q0 = pi/3;
dq0=0;
ddq0 = -w0^2*sin(q0);
q = zeros(3,np);
q(:,1) = [q0;dq0;ddq0];
residu = zeros(np,1);
tole = 1e-8;
nitermax = 20;
for ind = 1:np-1
    q_p = [q(1,ind)+dt*q(2,ind);q(2,ind);0];
    for iter = 1:nitermax
        if abs(q_p(3) + w0^2*sin(q_p(1))) >= tole
            cor_ddq = -(q_p(3)+w0^2*sin(q_p(1)))/(1+dt^2*w0^2*cos(q_p(1)));
            cor_dq = dt*cor_ddq;
            cor_q = dt*cor_dq;
            q_p = q_p + [cor_q;cor_dq;cor_ddq];
        end
    end
    residu(ind) = q_p(3) + w0^2*sin(q_p(1));
    q(:,ind+1) = q_p;
end
energy = 0.5*q(2,:).^2 - w0^2*cos(q(1,:));

figure;
plot(te,q(1,:),'-r','Linewidth',2);
figure;
plot(te,energy,'-b','Linewidth',2);