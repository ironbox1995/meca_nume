w0=2*pi;
w0c=w0^2;

dt6=0.01;
t6=(0:dt6:20)';
np6=size(t6,1);
q0=0;
dq0=0.25;
q6=zeros(np6,1);
dq=zeros(np6,1);
q6(1)=q0;
dq6(1)=dq0;
qj=[q0;dq0];
for inc=2:np6
    tc=t6(inc-1);
    xc=qj;
    k1=cal_fc(xc,tc,w0c);
    xc=qj+k1*dt6/2;
    k2=cal_fc(xc,tc+dt6/2,w0c);
    xc=qj+k2*dt6/2;
    k3=cal_fc(xc,tc+dt6/2,w0c);
    xc=qj+k3*dt6/2;
    k4=cal_fc(xc,tc+dt6,w0c);
    dq=(k1+2*k2+2*k3+k4)/6;
    qj=qj+dq*dt6;
    q6(inc)=qj(1);
    dq6(inc)=qj(2);
end
plot(t6,q6)
    
    
    