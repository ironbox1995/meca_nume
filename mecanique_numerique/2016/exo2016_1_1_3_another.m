clear all;
close all;
clc
eps=10^-10;
T0=2;
dtc=0.4;
tc=(0:dtc:T0)';
npc=size(tc,1);
qc=zeros(npc,1);
dqc=zeros(npc,1);
niter=zeros(npc,1);
qc(1)=1.0;
dqc(1)=0.0;
ind=1;
y=1;
for ind=2:npc
    qc(ind)=qc(ind-1)+dtc*dqc(ind-1);
    dqc(ind)=-2*(ind-1)*dtc*qc(ind)*qc(ind);
    R=qc(ind)-dqc(ind)*dtc-qc(ind-1);
    niter(ind)=0;
    while abs(y)>eps
        x=1+4*dtc*(ind-1)*dtc*qc(ind);
        y=-R/x;
        qc(ind)=qc(ind)+y;
        dqc(ind)=-2*(ind-1)*dtc*qc(ind)*qc(ind);
        R=qc(ind)-dqc(ind)*dtc-qc(ind-1);
        niter(ind)=niter(ind)+1;
    end
    y=1;
end;
qc=qc';
plot(tc,qc);
% plot(tc,energe)