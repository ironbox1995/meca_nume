dt1 = 0.001;
T0 = 6;
t1 = (0:dt1:T0)';
np1 = size(t1,1);
q1 = zeros(np1,1);
dq1 = zeros(np1,1);
energ1 = zeros(np1,1);

q0 = pi/3;
dq0 = 0;
w0 = 2*pi;
w0c = w0*w0;

q1(1) = q0;
dq1(1) = dq0;
ddq0c = -w0c*sin(q0);

for inc = 2:np1
    q1(inc) = q1(inc-1)+dt1*dq1(inc-1)+dt1*dt1*0.5*ddq0c;
    ddqc = -w0c*sin(q1(inc));
    dq1(inc) = dq1(inc-1)+0.5*dt1*(ddq0c+ddqc);
    ddq0c = ddqc;
end

energ1 = 0.5*(dq1 .*dq1) - w0c * cos(q1);
figure(1)
plot(t1,q1); 
figure(2)
plot(t1,dq1);  
figure(3)
plot(t1,energ1);