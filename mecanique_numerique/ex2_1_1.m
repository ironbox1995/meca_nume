sym q;
dsolve('D2q+2*Dq+5*q=exp(-t)+sin(2*t)','q(0)=10','Dq(0)=0')