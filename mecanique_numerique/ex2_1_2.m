t0 = 0 ;
tfinal = 10;
x0 = [10 0]';
[t,x] = ode45('vdp1',[t0 tfinal],x0);
% ode45（）求常微分方程的数值解
figure(1)
plot(t,x(:,1),'-b',t,x(:,2),'-r','Linewidth',2)
figure(2)
plot(x(:,2),x(:,1))