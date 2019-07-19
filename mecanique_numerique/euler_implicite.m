%Euler Implicite
clear all; 
close all; 
clc; 

omega=2*pi;
T0=6;
deltaT=0.02;

J = linspace(0,T0,T0/deltaT);
Y4=[];
e=0.0000001; % erreur
q=pi/30;
qd=0;
qd2=-omega^2*sin(q);

for j=1:(T0/(deltaT))  
Y4(j)=q;
qE=q+deltaT*qd;
qdE=qd+deltaT*qd2;
qd2E=qd2;
deltaq=0;
deltaqd=0;
deltaqd2=0;
    while abs(qd2E+omega^2*sin(qE)) > e
        deltaqd2=-(qd2E+omega^2*sin(qE))*(1+omega^2*deltaT^2*cos(qE))^(-1);
        deltaqd=deltaT*deltaqd2;
        deltaq=deltaT*deltaqd;
        qE=qE+deltaq;
        qdE=qdE+deltaqd;
        qd2E=qd2E+deltaqd2;
    end
q=qE;
qd=qdE;
qd2=qd2E;
end
figure(6)
plot(J,Y4); hold on
Y0=q*cos(omega*J);
plot(J,Y0);
legend('Euler Implicite','solution exacte');