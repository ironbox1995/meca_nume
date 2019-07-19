t0 = 0;
tfinal = 10;
x0 =[pi/4, pi/4,0.5, 0];
[t,x] = ode45('fun', [t0 tfinal],x0);
figure(1) 
plot(t,x(:,1),'-b',t,x(:,2),'-r', 'Linewidth',2)